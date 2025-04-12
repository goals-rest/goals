ActiveSupport::Notifications.subscribe "like.entry" do |event|
  Rails.logger.info "Received Entry::Like with id: #{event.payload.id}"

  notifiable = Notification::Like.build(entry_like: event.payload)
  notification = Notification.new(notifiable: notifiable)

  notification.deliver_later if notification.save
end

ActiveSupport::Notifications.subscribe "comment.entry" do |event|
  Rails.logger.info "Received Comment with id: #{event.payload.id}"

  notifiable = Notification::Comment.build(entry: event.payload)
  notification = Notification.new(notifiable: notifiable)

  notification.deliver_later if notification.save
end
