class UserNotification < ApplicationRecord
  belongs_to :user, inverse_of: :user_notifications, touch: true
  belongs_to :notification

  scope :unread, -> { where(read_at: nil) }
  scope :notification_center, -> do
    extending(UserNotificationScopes)
      .with_full_notifiable_context
      .order(created_at: :desc)
  end
end
