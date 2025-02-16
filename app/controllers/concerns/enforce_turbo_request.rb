module EnforceTurboRequest
  extend ActiveSupport::Concern

  def ensure_turbo_request
    return if turbo_frame_request?

    redirect_to root_path
  end
end
