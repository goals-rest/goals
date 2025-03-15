module Profiles
  class GoalPolicy < ProfilesPolicy
    def show?
      return true if owner?

      record.public_goal? && (profile_owner&.public_profile? || follows_profile_owner?)
    end

    relation_scope do |relation|
      next relation.where(user: profile_owner) if user&.id == profile_owner.id

      relation.where(user: profile_owner)
              .where(visibility: :public)
    end

    private
    def owner?
      record.user_id == user&.id
    end
  end
end
