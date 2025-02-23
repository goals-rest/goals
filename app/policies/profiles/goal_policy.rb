module Profiles
  class GoalPolicy < ProfilesPolicy
    relation_scope do |relation|
      next relation.where(user: profile_owner) if user&.id == profile_owner.id

      relation.where(user: profile_owner)
              .where(visibility: :public)
    end
  end
end
