module Profiles
  class GoalProgressChangesController < ProfilesController
    include UserScoped

    def index
      scope = authorized_scope(Goal::ProgressChange.all, with: Profiles::GoalProgressChangePolicy)
      scope = scope.includes(goal: :user).order(:created_at)
      scope = scope.with_created_at(params[:date] || Time.zone.now)
      @pagy, @progress_changes = pagy(scope)
    end
  end
end
