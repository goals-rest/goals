class GoalsController < DashboardController
  before_action :set_goal, only: %i[ edit update ]

  def index
    @goals = Goal.search(params[:search]).order(created_at: :desc)
  end

  def new
    @goal = Goal.new(start_date: Time.zone.today)
  end

  def create
    @goal = Goal.new(goal_params)

    if @goal.save
      redirect_to goals_path, notice: t(".success")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @goal.update(goal_params)
      redirect_to goals_path, notice: t(".success")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def set_goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:title, :description, :start_date, :end_date, :current, :target)
  end
end
