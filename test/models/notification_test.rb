require "test_helper"

class NotificationTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  should belong_to(:notifiable)

  should have_many(:user_notifications).dependent(:destroy)
end
