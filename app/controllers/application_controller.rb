class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  default_form_builder CustomFormBuilder

  private
  def redirect_back_to_profile(user, **options)
    redirect_back fallback_location: profile_path(username: user.username), **options
  end
end
