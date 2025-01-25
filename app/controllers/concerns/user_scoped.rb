module UserScoped
  extend ActiveSupport::Concern

  included do
    before_action :set_user
    before_action :require_follow
  end

  private
  def set_user
    @user = User.find_by(username: params[:username])
  end

  def require_follow
    return if Current.user == @user
    return if @user.public_profile?
    return if Current.user&.follows?(@user)

    redirect_to profile_path(@user.username)
  end
end
