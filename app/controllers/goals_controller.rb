class GoalsController < DashboardController
  before_action :set_goal, only: %i[ edit update destroy]

  def index
    @goals = Current.goals.search(params[:search]).order(created_at: :desc)
  end

  def new
    @goal = Current.goals.build(start_date: Time.zone.today)
  end

  def create
    @goal = Current.goals.build(goal_params)

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

  def destroy
    @goal.destroy

    redirect_to goals_path, notice: t(".success"), status: :see_other
  end

  private
  def set_goal
    @goal = Current.goals.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:title, :description, :start_date, :end_date, :current, :target)
  end
end
