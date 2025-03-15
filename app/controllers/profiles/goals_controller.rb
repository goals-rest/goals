module Profiles
  class GoalsController < ProfilesController
    include UserScoped

    layout :set_goals_layout, only: :show

    before_action :set_goal, only: :show

    def index
      scope = authorized_scope(Goal.all.order(created_at: :desc), with: Profiles::GoalPolicy)
      @pagy, @goals = pagy(scope)

      respond_to do |format|
        format.html
        format.turbo_stream if params[:load_more]
      end
    end

    def show
      authorize! @goal, with: Profiles::GoalPolicy
    end

    private
    def set_goals_layout
      return false if turbo_frame_request?

      "dashboard"
    end

    def set_goal
      @goal = @user.goals.find(params[:id])
    end
  end
end
