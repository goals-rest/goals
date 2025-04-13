ActiveSupport::Notifications.subscribe "like.entry" do |event|
  Rails.logger.info "Received Entry::Like with id: #{event.payload.id}"

  NotificationNotifier.with_default.notify_like(entry_like: event.payload)
end

ActiveSupport::Notifications.subscribe "comment.entry" do |event|
  Rails.logger.info "Received Comment with id: #{event.payload.id}"

  NotificationNotifier.with_default.notify_comment(entry: event.payload)
end
