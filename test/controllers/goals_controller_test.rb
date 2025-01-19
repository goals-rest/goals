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

  test "edit" do
    goal = create(:goal)
    get edit_goal_url(goal)
    assert_response :success
  end

  test "when params are valid it updates the goal" do
    goal = create(:goal, title: "Old title")

    patch goal_url(goal), params: { goal: { title: "New title" } }

    assert_redirected_to goals_path
    assert_equal goal.reload.title, "New title"
  end

  test "when params are invalid it doesn't update the goal" do
    goal = create(:goal, title: "Old title")

    patch goal_url(goal), params: { goal: { title: nil } }

    assert_response :unprocessable_entity
    assert_equal goal.reload.title, "Old title"
  end
end
