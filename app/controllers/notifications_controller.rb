class NotificationsController < DashboardController
  def index
    @notifications = Current.user.user_notifications.notification_center.order(created_at: :desc)
  end

  def destroy
    @notification = Current.user.user_notifications.find(params[:id])

    if @notification.destroy
      redirect_to notifications_path, notice: t(".success")
    else
      redirect_to notifications_path, alert: t(".error")
    end
  end
end
