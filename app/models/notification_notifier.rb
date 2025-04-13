class NotificationNotifier
  def initialize(notification_factory:)
    @notification_factory = notification_factory
  end

  def notify_like(entry_like:)
    deliver @notification_factory.create_like_notification(entry_like:)
  end

  def notify_comment(entry:)
    deliver @notification_factory.create_comment_notification(entry:)
  end

  def self.with_default
    new(notification_factory: NotificationFactory.new)
  end

  private
  def deliver(notification)
    notification.deliver_later if notification.save
  end
end
