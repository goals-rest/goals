module Entries
  class LikesController < ApplicationController
    include EnforceTurboRequest

    before_action :ensure_turbo_request, only: :index
    before_action :set_entry
    before_action :set_like, only: :destroy

    def index
      @pagy, @likes = pagy(@entry.likes.order(created_at: :desc), limit: 5)
    end

    def create
      @like = Entry::Like.build(entry: @entry, user: Current.user)

      respond_to do |format|
        if @like.save
          format.html { redirect_to @entry.entryable }
          format.turbo_stream
        else
          format.html { redirect_to @entry.entryable, alert: t(".error") }
          format.turbo_stream
        end
      end
    end

    def destroy
      @like.destroy

      respond_to do |format|
        format.html { redirect_to @entry.entryable }
        format.turbo_stream
      end
    end

    private

    def set_entry
      @entry = Entry.visible(Current.user).find(params[:entry_id])
    end

    def set_like
      @like = @entry.like_for(Current.user)

      return if @like.present?

      respond_to do |format|
        format.html { redirect_to @entry.entryable }
        format.turbo_stream { head :no_content }
      end
    end
  end
end
