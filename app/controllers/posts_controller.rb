class PostsController < DashboardController
  def new
    @post = Post.new
  end

  def create
    @post, entry = Entry.build_with_post(Post.new(post_params))

    if entry.save
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
