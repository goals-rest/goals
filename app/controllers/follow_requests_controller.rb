class FollowRequestsController < DashboardController
  def index
    @follow_requests = Current.user.follow_requests
  end
end
