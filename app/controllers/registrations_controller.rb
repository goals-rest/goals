class RegistrationsController < ApplicationController
  skip_before_action :require_authentication

  def new
    @user = User.new
  end
end
