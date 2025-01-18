require "test_helper"

class Dashboard::GoalsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get dashboard_goals_url
    assert_response :success
  end

  test "new" do
    get new_dashboard_goal_url
    assert_response :success
  end

  test "can create goal" do
    assert_difference("Goal.count") do
      post dashboard_goals_url, params: { goal: attributes_for(:goal) }
    end

    assert_redirected_to dashboard_goals_path
  end

  test "cannot create goal" do
    assert_no_difference("Goal.count") do
      post dashboard_goals_url, params: { goal: { title: "" } }
    end

    assert_response :unprocessable_entity
  end
end
