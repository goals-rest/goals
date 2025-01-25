class FollowRequests::AcceptFollowRequestsController < ApplicationController
  before_action :set_follow_request

  def create
    @follow_request.accept!
    redirect_to follow_requests_path, notice: t(".success")
  rescue ActiveRecord::ActiveRecordError
    redirect_to follow_requests_path, alert: t(".error")
  end

  private
  def set_follow_request
    @follow_request = Current.user.follow_requests.find(params[:follow_request_id])
  end
end
