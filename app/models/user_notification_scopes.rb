module UserNotificationScopes
  def with_full_notifiable_context
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
  end
end
