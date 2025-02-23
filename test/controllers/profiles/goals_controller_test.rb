require "test_helper"
require "action_policy/test_helper"

class Profiles::GoalsControllerTest < ActionDispatch::IntegrationTest
  include ActionPolicy::TestHelper

  test "index" do
    user = create(:user)

    sign_in user

    get profile_goals_url(user.username)

    assert_response :success
  end

  test "index has authorized scope" do
    user = create(:user)

    sign_in user

    assert_have_authorized_scope(type: :active_record_relation, with: Profiles::GoalPolicy) do
      get profile_goals_url(user.username)
    end
  end
end
