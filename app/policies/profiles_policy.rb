class ProfilesPolicy < ApplicationPolicy
  authorize :profile_owner

  private
  def follows_profile_owner?
    return false if user.blank?

    user.follows?(profile_owner)
  end
end
