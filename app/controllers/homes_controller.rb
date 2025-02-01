class HomesController < DashboardController
  def show
    @user = Current.user
    @posts = Post.all
    @goals = @user.goals
  end
end
