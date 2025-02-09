class Entries::CommentsController < ApplicationController
  before_action :ensure_turbo_request, only: %i[index new]
  before_action :set_entry
  before_action :ensure_current_user_has_access

  def index
    @pagy, @comments = pagy(@entry.comments.order(created_at: :desc), limit: 3)
  end

  def new
    @comment = @entry.comments.build
  end

  def create
    comment = @entry.comments.build(comment_params)
    @comment, entry = Entry.build_with_comment(comment)

    unless entry.save
      render :new, status: :unprocessable_entity
    end
  end

  private
  def ensure_turbo_request
    return if turbo_frame_request?

    redirect_to root_path
  end

  def ensure_current_user_has_access
    return if Current.user == @entry.owner ||
                @entry.owner.public_profile? ||
                Current.user.follows?(@entry.owner)

    redirect_to root_path
  end

  def set_entry
    @entry = Entry.find(params[:entry_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
