require "test_helper"

class Notification::LikeTest < ActiveSupport::TestCase
  should belong_to(:entry_like)
  should have_one(:notification)
end
