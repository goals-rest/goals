class RegistrationsController < ApplicationController
  skip_before_action :require_authentication

  def new
    @user = User.new
  end

  def create
    @user = User.build(user_params)

    if @user.save
      start_new_session_for(@user)
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity, alert: t(".error")
    end
  end

  private
  def user_params
    params.require(:user)
      .permit(:first_name, :last_name, :email_address, :password, :password_confirmation)
  end
end
