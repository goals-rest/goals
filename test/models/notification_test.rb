require "test_helper"

class NotificationTest < ActiveSupport::TestCase
  should belong_to(:notifiable)
end
