class UserNotification < ApplicationRecord
  belongs_to :user
  belongs_to :notification

  scope :unread, -> { where(read_at: nil) }
  scope :notification_center, -> do
    includes(
      notification: {
        notifiable: [
          entry_like: {
            user: :avatar_attachment,
            entry: [
              :entryable
            ]
          },
          entry: [
            entryable: [
              owner: :avatar_attachment,
              parent: [
                :entryable,
                owner: :avatar_attachment
              ]
            ],
            owner: :avatar_attachment
          ]
        ]
      }
    )
    .order(created_at: :desc)
  end
end
