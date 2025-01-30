class PostsController < DashboardController
  def new
    @post = Current.posts.build
  end

  def create
    @post = Current.posts.build(post_params)

    if @post.save
      redirect_to home_path, notice: t(".success")
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
