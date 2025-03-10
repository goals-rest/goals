module Profiles
  class FeedEntriesController < ProfilesController
    include UserScoped

    before_action :set_entry, only: %i[destroy]

    def destroy
      authorize!(@entry, with: Profiles::FeedEntryPolicy)
      @entry.destroy

      respond_to do |format|
        format.html { redirect_to profile_path(@user.username), notice: t(".success") }
        format.turbo_stream { flash.now[:notice] = t(".success") }
      end
    end

    private
    def set_entry
      @entry = Entry.find(params[:id])
    end
  end
end
