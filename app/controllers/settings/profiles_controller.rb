module Settings
  class ProfilesController < DashboardController
    before_action :set_user

    def edit; end

    def update
      if @user.update(user_params)
        redirect_to edit_settings_profile_path, notice: t(".success")
      else
        render :edit, status: :unprocessable_entity, alert: t(".error")
      end
    end

    private
    def set_user
      @user = User.find(Current.user.id)
    end

    def user_params
      params.require(:user)
            .permit(:avatar, :first_name, :last_name, :username, :email_address, :new_password, :current_password, :profile_visibility)
    end
  end
end
