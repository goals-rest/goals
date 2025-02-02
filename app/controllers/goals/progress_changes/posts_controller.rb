class Goals::ProgressChanges::PostsController < DashboardController
  include GoalScoped

  before_action :set_progress_change

  def new
    @post = Post.new(
      title: @goal.title,
      goal_progress_change: @progress_change
    )
  end

  def create
    @post = Post.new(post_params)
    @post, entry = Entry.build_with_post(@post)

    if entry.save
      redirect_to home_path, notice: t(".success")
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def set_progress_change
    @progress_change = @goal.progress_changes.find(params[:goal_progress_change_id])
  end

  def post_params
    params.require(:post)
      .permit(:title, :body)
      .merge(goal_progress_change: @progress_change)
  end
end
