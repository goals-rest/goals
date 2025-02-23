class ProfilesController < ApplicationController
  skip_before_action :require_authentication

  before_action :resume_session
  before_action :set_user, only: %i[show]

  def show
    @entries = Entry
                    .includes(owner: { avatar_attachment: :blob })
                    .posts_owned_by(@user)
                    .order(created_at: :desc)
    @pagy, @entries = pagy(@entries, limit: 2)

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  private
  def set_user
    @user = User.find_by(username: params[:username])

    redirect_to root_path if @user.blank?
  end

  def profile_visitor?
    Current.user != @user
  end
  helper_method :profile_visitor?

  def profile_owner?
    Current.user == @user
  end
  helper_method :profile_owner?
end
