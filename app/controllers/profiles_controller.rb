class ProfilesController < ApplicationController
  skip_before_action :require_authentication

  before_action :resume_session
  before_action :set_user, only: %i[show]

  def show; end

  private
  def set_user
    @user = User.find_by(id: params[:id])

    redirect_to root_path if @user.blank?
  end
end
