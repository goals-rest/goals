require "test_helper"

class Dashboard::GoalsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_dashboard_goal_url
    assert_response :success
  end

  test "when params are valid it should create goal" do
    assert_difference("Goal.count") do
      post dashboard_goals_url, params: { goal: attributes_for(:goal) }
    end

    assert_redirected_to dashboard_home_path
  end

  test "when params are invalid it should not create goal" do
    assert_no_difference("Goal.count") do
      post dashboard_goals_url, params: { goal: { title: "" } }
    end

    assert_response :unprocessable_entity
  end
end
