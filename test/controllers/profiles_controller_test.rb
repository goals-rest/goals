require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "show" do
    user = create(:user)

    sign_in user

    get profile_url(user)

    assert_response :success
  end
end
