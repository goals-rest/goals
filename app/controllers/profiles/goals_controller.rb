module Profiles
  class GoalsController < ProfilesController
    include UserScoped

    def index
      scope = authorized_scope(Goal.all.order(created_at: :desc), with: Profiles::GoalPolicy)
      @pagy, @goals = pagy(scope)
    end
  end
end
