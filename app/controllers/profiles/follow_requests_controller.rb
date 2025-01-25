class Profiles::FollowRequestsController < ProfilesController
  include UserScoped

  skip_before_action :require_follow
  before_action :set_follow_request, only: %i[destroy]

  def create
    @follow_request = @user.follow_requests.build(requester: Current.user)

    if @follow_request.save
      redirect_back_to_profile @user, notice: t(".success")
    else
      redirect_back_to_profile @user, alert: t(".error")
    end
  end

  def destroy
    if @follow_request.destroy
      redirect_back_to_profile @user, notice: t(".success")
    else
      redirect_back_to_profile @user, alert: t(".error")
    end
  end

  private
  def set_follow_request
    @follow_request = @user.follow_requests.find_by!(requester: Current.user)
  end
end
