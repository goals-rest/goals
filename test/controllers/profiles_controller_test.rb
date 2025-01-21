require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "show" do
    user = create(:user)

    sign_in user

    get profile_url(username: user.username)

    assert_response :success
  end

  test "show without authentication" do
    user = create(:user)

    get profile_url(username: user.username)

    assert_response :success
  end
end
