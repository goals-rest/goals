class FollowsController < ApplicationController
  before_action :set_follow, only: %i[destroy]
  before_action :set_followee, only: %i[create]

  def create
    @follow = Current.user.follows.build(follow_params)

    if @follow.save
      redirect_back_to_profile @followee, notice: t(".success")
    else
      redirect_back_to_profile @followee, alert: t(".error"), status: :unprocessable_entity
    end
  end

  def destroy
    if @follow.destroy
      redirect_back_to_profile @follow.followee, notice: t(".success")
    else
      redirect_back_to_profile @follow.followee, alert: t(".error"), status: :unprocessable_entity
    end
  end

  private
  def follow_params
    params.require(:follow).permit(:followee_id)
  end

  def set_follow
    @follow = Current.user.follows.find(params[:id])
  end

  def set_followee
    @followee = User.find_by(id: follow_params[:followee_id])

    return if @followee.present?

    redirect_back fallback_location: root_path, alert: t(".user_not_found")
  end

  def redirect_back_to_profile(user, **options)
    redirect_back fallback_location: profile_path(username: user.username), **options
  end
end
