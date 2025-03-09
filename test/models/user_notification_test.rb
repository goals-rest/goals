require "test_helper"

class UserNotificationTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:notification)
end
