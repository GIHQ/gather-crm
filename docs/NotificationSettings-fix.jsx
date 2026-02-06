// GATHER Notification Settings - FIXED VERSION
// This replaces the broken NotificationSettings component in index.html
//
// FIXES:
// 1. Delivery method buttons now fit on screen (flex-1 with min-w-0)
// 2. Toggle switches properly aligned (flex-shrink-0)
// 3. Card content constrained to prevent overflow (min-w-0 on text containers)
// 4. Proper padding and spacing for mobile

const NotificationSettingsModal = ({ isOpen, onClose, initialSettings, onSave }) => {
  const [settings, setSettings] = useState(initialSettings || {
    pushEnabled: false,
    emailEnabled: true,
    dailySummary: false,
    weeklySummary: true,
    activityAlerts: false,
    overdueAlerts: false,
    newsMentions: true,
  });
  const [saving, setSaving] = useState(false);

  if (!isOpen) return null;

  const handleSave = async () => {
    setSaving(true);
    localStorage.setItem('gather_notification_settings', JSON.stringify(settings));
    await new Promise(r => setTimeout(r, 500));
    setSaving(false);
    onSave?.(settings);
    onClose();
  };

  // Toggle component - fixed width
  const Toggle = ({ enabled, onChange }) => (
    <button
      onClick={() => onChange(!enabled)}
      className={`relative w-12 h-7 rounded-full transition-colors flex-shrink-0 ${
        enabled ? 'bg-orange-500' : 'bg-gray-300'
      }`}
    >
      <span
        className={`absolute top-1 w-5 h-5 bg-white rounded-full shadow transition-transform ${
          enabled ? 'translate-x-6' : 'translate-x-1'
        }`}
      />
    </button>
  );

  // Delivery method button - uses flex-1 to share space evenly
  const DeliveryButton = ({ icon, label, enabled, onChange }) => (
    <button
      onClick={() => onChange(!enabled)}
      className={`flex-1 min-w-0 flex items-center justify-center gap-2 py-3 px-4 rounded-xl border-2 transition ${
        enabled
          ? 'border-orange-500 bg-orange-50 text-orange-600'
          : 'border-gray-200 bg-white text-gray-600'
      }`}
    >
      {icon}
      <span className="font-medium truncate">{label}</span>
    </button>
  );

  // Notification card - text truncates, toggle stays visible
  const NotificationCard = ({ icon, title, description, enabled, onChange }) => (
    <div
      className={`flex items-center gap-3 p-4 rounded-xl border transition ${
        enabled
          ? 'bg-orange-50 border-orange-200'
          : 'bg-white border-gray-200'
      }`}
    >
      <span className="text-2xl flex-shrink-0">{icon}</span>
      <div className="flex-1 min-w-0">
        <h4 className="font-semibold text-gray-900 truncate">{title}</h4>
        <p className="text-sm text-gray-500 truncate">{description}</p>
      </div>
      <Toggle enabled={enabled} onChange={onChange} />
    </div>
  );

  // Bell icon
  const BellIcon = () => (
    <svg className="w-5 h-5 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9" />
    </svg>
  );

  // Envelope icon
  const EnvelopeIcon = () => (
    <svg className="w-5 h-5 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
    </svg>
  );

  return (
    <div className="fixed inset-0 z-50 bg-white flex flex-col">
      {/* Header */}
      <div className="flex items-center justify-between px-4 py-3 border-b border-gray-200">
        <button onClick={onClose} className="text-gray-600 font-medium">
          Cancel
        </button>
        <h2 className="font-semibold text-gray-900">Notifications</h2>
        <button 
          onClick={handleSave}
          disabled={saving}
          className="text-orange-500 font-semibold disabled:opacity-50"
        >
          {saving ? 'Saving...' : 'Save'}
        </button>
      </div>

      {/* Content - scrollable */}
      <div className="flex-1 overflow-y-auto">
        <div className="p-4 space-y-6">
          {/* Delivery Method */}
          <div>
            <h3 className="text-xs font-semibold text-gray-500 uppercase tracking-wide mb-3">
              Delivery Method
            </h3>
            <div className="flex gap-3">
              <DeliveryButton
                icon={<BellIcon />}
                label="Push"
                enabled={settings.pushEnabled}
                onChange={(v) => setSettings(s => ({ ...s, pushEnabled: v }))}
              />
              <DeliveryButton
                icon={<EnvelopeIcon />}
                label="Email"
                enabled={settings.emailEnabled}
                onChange={(v) => setSettings(s => ({ ...s, emailEnabled: v }))}
              />
            </div>
            {!settings.pushEnabled && !settings.emailEnabled && (
              <p className="text-sm text-red-500 mt-2">Select at least one delivery method</p>
            )}
          </div>

          {/* Notification Types */}
          <div>
            <h3 className="text-xs font-semibold text-gray-500 uppercase tracking-wide mb-3">
              What to Notify
            </h3>
            <div className="space-y-3">
              <NotificationCard
                icon="📊"
                title="Daily Summary"
                description="Morning overview of your priorities"
                enabled={settings.dailySummary}
                onChange={(v) => setSettings(s => ({ ...s, dailySummary: v }))}
              />
              <NotificationCard
                icon="📅"
                title="Weekly Summary"
                description="Week recap every Monday"
                enabled={settings.weeklySummary}
                onChange={(v) => setSettings(s => ({ ...s, weeklySummary: v }))}
              />
              <NotificationCard
                icon="⚡"
                title="Activity Alerts"
                description="When team members log interactions"
                enabled={settings.activityAlerts}
                onChange={(v) => setSettings(s => ({ ...s, activityAlerts: v }))}
              />
              <NotificationCard
                icon="🔴"
                title="Overdue Alerts"
                description="When follow-ups become overdue"
                enabled={settings.overdueAlerts}
                onChange={(v) => setSettings(s => ({ ...s, overdueAlerts: v }))}
              />
              <NotificationCard
                icon="📰"
                title="News Mentions"
                description="When fellows appear in the news"
                enabled={settings.newsMentions}
                onChange={(v) => setSettings(s => ({ ...s, newsMentions: v }))}
              />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

// ============================================================
// CSS FIXES TO ADD TO THE STYLE TAG
// ============================================================
// Make sure these utility classes are working:
//
// .min-w-0 { min-width: 0; }           /* Allows flex children to shrink below content size */
// .flex-shrink-0 { flex-shrink: 0; }   /* Prevents element from shrinking */
// .truncate { 
//   overflow: hidden;
//   text-overflow: ellipsis;
//   white-space: nowrap;
// }

// ============================================================
// KEY FIXES EXPLAINED
// ============================================================
//
// Problem 1: Delivery buttons going off screen
// Fix: Use `flex-1 min-w-0` on each button so they share space equally
//      and can shrink below their content size
//
// Problem 2: Toggle switches getting cut off
// Fix: Add `flex-shrink-0` to Toggle component (w-12 h-7 is now fixed)
//      Add `min-w-0` to the text container so IT shrinks, not the toggle
//
// Problem 3: Card content overflowing
// Fix: Add `truncate` class to title and description
//      Add `min-w-0` to the flex-1 text container
//
// Problem 4: Icon sizing
// Fix: Add `flex-shrink-0` to icon spans so they don't compress
