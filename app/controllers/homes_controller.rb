class HomesController < DashboardController
  def show
    @user = Current.user
    @posts = Post.feed(@user).sorted
    @goals = @user.goals
  end
end
