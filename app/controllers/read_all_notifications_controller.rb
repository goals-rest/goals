class ReadAllNotificationsController < DashboardController
  def update
    user_notifications = Current.user.user_notifications
    unread_notifications = user_notifications.unread

    if unread_notifications.any?
      unread_notifications.update_all(read_at: Time.zone.now)
    end

    render(turbo_stream: turbo_stream.update(
      :notification_toggle,
      ::Notifications::ToggleComponent.new(user_notifications: user_notifications)
    ))
  end
end
