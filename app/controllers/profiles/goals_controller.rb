module Profiles
  class GoalsController < ProfilesController
    include UserScoped

    def index
      scope = authorized_scope(Goal.all.order(created_at: :desc), with: Profiles::GoalPolicy)
      @pagy, @goals = pagy(scope)

      respond_to do |format|
        format.html
        format.turbo_stream if params[:load_more]
      end
    end
  end
end
