require "test_helper"

class NotificationsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    user = create(:user)

    sign_in user

    get follow_requests_url

    assert_response :success
  end

  test "deletes the notification" do
    user = create(:user)
    notification = create(:user_notification, user:)

    sign_in user

    assert_difference "UserNotification.count", -1 do
      delete notification_path(notification)
    end

    assert_response :redirect
    assert flash[:notice]
  end

  test "returns a Not Found response when attempting to delete a non-existent notification" do
    user = create(:user)

    sign_in user

    delete follow_request_path(id: 1)

    assert_response :not_found
  end
end
