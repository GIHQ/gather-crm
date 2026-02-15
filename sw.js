// GATHER PWA Service Worker
const CACHE_NAME = 'gather-v4.3.0';
const OFFLINE_URL = '/index.html';

// Assets to cache on install
const PRECACHE_ASSETS = [
  '/index.html',
  '/manifest.json',
];

// Install event - cache assets
self.addEventListener('install', (event) => {
  console.log('[SW] Installing GATHER Service Worker...');
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then((cache) => {
        console.log('[SW] Pre-caching app shell');
        return cache.addAll(PRECACHE_ASSETS);
      })
      .then(() => self.skipWaiting())
  );
});

// Activate event - clean old caches
self.addEventListener('activate', (event) => {
  console.log('[SW] Activating GATHER Service Worker...');
  event.waitUntil(
    caches.keys()
      .then((cacheNames) => {
        return Promise.all(
          cacheNames
            .filter((name) => name !== CACHE_NAME)
            .map((name) => {
              console.log('[SW] Removing old cache:', name);
              return caches.delete(name);
            })
        );
      })
      .then(() => self.clients.claim())
  );
});

// Fetch event - network-first for HTML, cache-first for assets
self.addEventListener('fetch', (event) => {
  // Skip non-GET requests
  if (event.request.method !== 'GET') return;

  // Skip Supabase API calls (always fetch fresh)
  if (event.request.url.includes('supabase.co')) return;

  // For HTML files and navigation - stale-while-revalidate with 3s network timeout
  // Serves cached version immediately on slow networks, then updates cache in background
  const isHTML = event.request.url.endsWith('.html') ||
                 event.request.mode === 'navigate' ||
                 event.request.headers.get('accept')?.includes('text/html');

  if (isHTML) {
    event.respondWith(
      caches.match(event.request).then((cachedResponse) => {
        // Race: serve cache immediately OR wait up to 3s for network
        const networkFetch = fetch(event.request).then((networkResponse) => {
          // Update cache with fresh response
          if (networkResponse && networkResponse.status === 200) {
            const responseToCache = networkResponse.clone();
            caches.open(CACHE_NAME)
              .then((cache) => cache.put(event.request, responseToCache));
          }
          return networkResponse;
        });

        if (cachedResponse) {
          // Have cache: serve it immediately, update in background
          // But if network is fast (< 3s), prefer fresh response
          const timeoutPromise = new Promise((resolve) =>
            setTimeout(() => resolve(cachedResponse), 3000)
          );
          return Promise.race([networkFetch, timeoutPromise])
            .catch(() => cachedResponse);
        }

        // No cache: must wait for network (first visit)
        return networkFetch.catch(() => caches.match(OFFLINE_URL));
      })
    );
    return;
  }

  // For other assets - cache first, then network
  event.respondWith(
    caches.match(event.request)
      .then((cachedResponse) => {
        if (cachedResponse) {
          return cachedResponse;
        }

        // Not in cache, fetch from network
        return fetch(event.request)
          .then((networkResponse) => {
            if (!networkResponse || networkResponse.status !== 200) {
              return networkResponse;
            }

            // Cache the response
            const responseToCache = networkResponse.clone();
            caches.open(CACHE_NAME)
              .then((cache) => cache.put(event.request, responseToCache));

            return networkResponse;
          })
          .catch(() => {});
      })
  );
});

// Push notification event
self.addEventListener('push', (event) => {
  console.log('[SW] Push notification received');
  
  let data = {
    title: 'GATHER',
    body: 'You have a new notification',
    icon: '/icon-192.png',
    badge: '/icon-192.png',
    tag: 'gather-notification',
    data: {}
  };
  
  if (event.data) {
    try {
      data = { ...data, ...event.data.json() };
    } catch (e) {
      data.body = event.data.text();
    }
  }
  
  const options = {
    body: data.body,
    icon: data.icon,
    badge: data.badge,
    tag: data.tag,
    vibrate: [200, 100, 200],
    data: data.data,
    actions: data.actions || [
      { action: 'open', title: 'Open GATHER' },
      { action: 'dismiss', title: 'Dismiss' }
    ],
    requireInteraction: data.requireInteraction || false
  };
  
  event.waitUntil(
    self.registration.showNotification(data.title, options)
  );
});

// Notification click event
self.addEventListener('notificationclick', (event) => {
  console.log('[SW] Notification clicked:', event.action);
  event.notification.close();
  
  if (event.action === 'dismiss') return;
  
  const urlToOpen = event.notification.data?.url || '/gather-mobile.html';
  
  event.waitUntil(
    clients.matchAll({ type: 'window', includeUncontrolled: true })
      .then((windowClients) => {
        // Check if there's already a window open
        for (const client of windowClients) {
          if (client.url.includes('gather') && 'focus' in client) {
            client.postMessage({
              type: 'notification-clicked',
              data: event.notification.data
            });
            return client.focus();
          }
        }
        // Open new window
        if (clients.openWindow) {
          return clients.openWindow(urlToOpen);
        }
      })
  );
});

// Background sync event (for offline interactions)
self.addEventListener('sync', (event) => {
  console.log('[SW] Background sync:', event.tag);
  
  if (event.tag === 'sync-interactions') {
    event.waitUntil(syncPendingInteractions());
  }
});

// Sync pending interactions that were created offline
async function syncPendingInteractions() {
  try {
    const cache = await caches.open('gather-pending-data');
    const requests = await cache.keys();
    
    for (const request of requests) {
      const response = await cache.match(request);
      const data = await response.json();
      
      // POST to Supabase
      const res = await fetch('https://pwazurumpzydxyppbvee.supabase.co/rest/v1/interactions', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'apikey': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InB3YXp1cnVtcHp5ZHh5cHBidmVlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MjM3MDUsImV4cCI6MjA4NTA5OTcwNX0.iGLmSpTPM84lMGGizSfBnkDCvpMZaJVaFhcRJ9cYDrs'
        },
        body: JSON.stringify(data)
      });
      
      if (res.ok) {
        await cache.delete(request);
        console.log('[SW] Synced pending interaction');
      }
    }
  } catch (err) {
    console.error('[SW] Sync failed:', err);
  }
}

// Periodic background sync for daily summary notifications
self.addEventListener('periodicsync', (event) => {
  if (event.tag === 'daily-summary') {
    event.waitUntil(sendDailySummary());
  }
});

async function sendDailySummary() {
  // This would typically fetch from your backend
  const notificationData = {
    title: 'GATHER Daily Summary',
    body: 'You have 5 fellows needing follow-up today',
    icon: '/icon-192.png',
    data: { url: '/gather-mobile.html' }
  };
  
  await self.registration.showNotification(notificationData.title, {
    body: notificationData.body,
    icon: notificationData.icon,
    data: notificationData.data,
    tag: 'daily-summary'
  });
}

console.log('[SW] GATHER Service Worker loaded');
