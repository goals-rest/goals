module Profiles
  class GoalPolicy < ProfilesPolicy
    pre_check :allow_owner

    def show?
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

    def allow_owner
      allow! if owner?
    end
  end
end
