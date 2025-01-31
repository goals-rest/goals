class FollowRequestsController < DashboardController
  before_action :set_follow_request, only: %i[destroy]

  def index
    @follow_requests = Current.user.follow_requests
  end

  def destroy
    if @follow_request.destroy
      redirect_to follow_requests_path, notice: t(".success")
    else
      redirect_to follow_requests_path, alert: t(".error")
    end
  end

  private
  def set_follow_request
    @follow_request = Current.user.follow_requests.find(params[:id])
  end
end
