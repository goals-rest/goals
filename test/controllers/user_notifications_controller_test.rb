require "test_helper"

class UserNotificationsControllerTest < ActionDispatch::IntegrationTest
  test "marks all current user notifications as read when the user hasn't read them yet" do
    freeze_time
    user = create(:user)
    notification_a = create(:user_notification, read_at: nil, user:)
    notification_b = create(:user_notification, read_at: nil, user:)

    sign_in user
    put user_notification_path(user)

    assert_equal Time.zone.now, notification_a.reload.read_at
    assert_equal Time.zone.now, notification_b.reload.read_at
    travel_back
  end

  test "doesn't update current user notifications when the user has already read them" do
    user = create(:user)
    notification_a = create(:user_notification, read_at: Time.zone.yesterday, user:)
    notification_b = create(:user_notification, read_at: Time.zone.yesterday, user:)

    sign_in user
    put user_notification_path(user)

    assert_equal Time.zone.yesterday.to_date, notification_a.reload.read_at.to_date
    assert_equal Time.zone.yesterday.to_date, notification_b.reload.read_at.to_date
  end

  test "marks current user’s notifications as read even with another user ID in the request" do
    freeze_time
    user = create(:user)
    another_user = create(:user)
    notification_a = create(:user_notification, read_at: nil, user:)
    notification_b = create(:user_notification, read_at: nil, user:)

    sign_in user
    put user_notification_path(another_user)

    assert_equal Time.zone.now, notification_a.reload.read_at
    assert_equal Time.zone.now, notification_b.reload.read_at
    travel_back
  end
end
