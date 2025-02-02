class FeedController < DashboardController
  def index
    @pagy, @entries = pagy(Current.entries.feed.order(created_at: :desc))

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
end
