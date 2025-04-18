class NotificationFactory
  def create_like_notification(entry_like:)
    notifiable = Notification::Like.build(entry_like:)
    Notification.build(notifiable:)
  end

  def create_comment_notification(entry:)
    notifiable = Notification::Comment.build(entry:)
    Notification.build(notifiable:)
  end

  def create_follow_notification(follow:)
    notifiable = Notification::Follow.build(follow:)
    Notification.build(notifiable:)
  end
end
