module Profiles
  class GoalProgressChangePolicy < ProfilesPolicy
    pre_check :allow_owner

    relation_scope do |relation|
      next relation.joins(:goal).where(goal: { user: profile_owner }) if user&.id == profile_owner.id

      relation.joins(:goal)
              .where(goal: { user: profile_owner })
              .where(goal: { visibility: :public })
    end
  end
end
