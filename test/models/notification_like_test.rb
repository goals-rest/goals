require "test_helper"

class NotificationLikeTest < ActiveSupport::TestCase
  should belong_to(:entry_like)
  should have_one(:notification)
end
