class PostsController < DashboardController
  before_action :set_post, only: :show

  def new
    @post = Post.new
  end

  def show
    authorize! @post

    respond_to do |format|
      format.html
      format.turbo_stream
    end
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
    params.require(:post).permit(:title, :body, images: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
