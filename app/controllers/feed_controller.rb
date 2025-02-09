class FeedController < DashboardController
  def index
    @entries = Current.entries
                      .includes(owner: { avatar_attachment: :blob })
                      .feed
                      .order(created_at: :desc)
    @pagy, @entries = pagy(@entries)

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
end
