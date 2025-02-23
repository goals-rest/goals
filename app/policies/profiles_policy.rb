class ProfilesPolicy < ApplicationPolicy
  authorize :profile_owner
end
