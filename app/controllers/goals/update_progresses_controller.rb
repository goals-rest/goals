module Goals
  class UpdateProgressesController < DashboardController
    include GoalScoped

    before_action :ensure_turbo_request, only: %i[edit]

    def new; end

    def update
      if @goal.update(goal_params)
        redirect_to new_goal_goal_progress_change_post_path(
          goal_id: @goal.id,
          goal_progress_change_id: @goal.progress_changes.last.id
        ), notice: t(".success")
      else
        redirect_to goals_path, alert: t(".error")
      end
    end

    private
    def goal_params
      params.require(:goal).permit(:current)
    end

    def ensure_turbo_request
      return if turbo_frame_request?

      redirect_to root_path
    end
  end
end
