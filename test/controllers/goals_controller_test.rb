require "test_helper"

class GoalsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get goals_url
    assert_response :success
  end

  test "new" do
    get new_goal_url
    assert_response :success
  end

  test "can create goal" do
    assert_difference("Goal.count") do
      post goals_url, params: { goal: attributes_for(:goal) }
    end

    assert_redirected_to goals_path
  end

  test "cannot create goal" do
    assert_no_difference("Goal.count") do
      post goals_url, params: { goal: { title: "" } }
    end

    assert_response :unprocessable_entity
  end
end
