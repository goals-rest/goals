class Profiles::FollowersController < ProfilesController
  include UserScoped

  before_action :set_follow, only: %i[destroy]

  def index
    @followers = @user.followers
  end

  def destroy
    if @follow.destroy
      redirect_back_to_profile @user, notice: t(".success")
    else
      redirect_back_to_profile @user, alert: t(".error")
    end
  end

  private
  def set_follow
    @follow = Follow.find_by(follower_id: params[:id], followee_id: @user.id)

    return if @follow.present?

    redirect_back_to_profile @user, alert: t(".not_found")
  end
end
