module Entries
  class LikesController < ApplicationController
    before_action :set_entry
    before_action :set_like, only: :destroy

    def create
      @like = Entry::Like.build(entry: @entry, user: Current.user)

      respond_to do |format|
        if @like.save
          format.html { redirect_to @entry.entryable }
        else
          format.html { redirect_to @entry.entryable, alert: t(".error") }
        end

        format.turbo_stream
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
      @entry = Entry.where(owner: Current.user)
                    .or(Entry.where(owner: Current.user.followees))
                    .find(params[:entry_id])
    end

    def set_like
      @like = @entry.like_for(Current.user)
    end
  end
end
