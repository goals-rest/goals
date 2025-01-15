require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "new" do
    get new_session_url
    assert_response :success
  end

  test "can sign in" do
    user = create(:user)

    post session_url, params: { email_address: user.email_address, password: user.password }

    assert_redirected_to root_url
  end

  test "creates a new session" do
    user = create(:user)

    post session_url, params: { email_address: user.email_address, password: user.password }

    assert_equal 1, Session.count
  end
end
