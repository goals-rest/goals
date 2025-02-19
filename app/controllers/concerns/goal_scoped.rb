module GoalScoped
  extend ActiveSupport::Concern

  included do
    before_action :set_goal
  end

  private
  def set_goal
    @goal = Current.goals.find(params[:goal_id])
  end
end
