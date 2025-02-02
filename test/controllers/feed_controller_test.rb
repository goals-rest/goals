require "test_helper"

class FeedControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    user = create(:user)

    sign_in user

    get feed_index_url

    assert_response :success
  end
end
