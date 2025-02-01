class HomesController < DashboardController
  def show
    @user = Current.user
    @posts = Post.where(owner: @user).or(Post.where(owner: @user.followees)).order(created_at: :desc)
    @goals = @user.goals
  end
end
