class HomesController < DashboardController
  def show
    @user = Current.user
    @goals = @user.goals
  end
end
