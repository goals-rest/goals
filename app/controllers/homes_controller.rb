class HomesController < DashboardController
  def show
    @user = Current.user
    @goals = @user.goals.pending.limit(5).to_a.sort_by(&:progress).reverse
  end
end
