module Dashboard
  class GoalsController < DashboardController
    def index
      @goals = Goal.search(params[:search]).order(created_at: :desc)
    end

    def new
      @goal = Goal.new(start_date: Time.zone.today)
    end

    def create
      @goal = Goal.new(goal_params)

      if @goal.save
        redirect_to dashboard_goals_path, notice: t(".success")
      else
        render :new, status: :unprocessable_entity
      end
    end

    def goal_params
      params.require(:goal).permit(:title, :description, :start_date, :end_date, :current, :target)
    end
  end
end
