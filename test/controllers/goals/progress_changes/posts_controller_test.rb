require "test_helper"

class Goals::ProgressChanges::PostsControllerTest < ActionDispatch::IntegrationTest
  test "new" do
    user = create(:user)
    goal = create(:goal, user:)
    progress_change = create(:goal_progress_change, goal:)

    sign_in user

    get new_goal_goal_progress_change_post_path(goal_id: goal.id, goal_progress_change_id: progress_change.id)

    assert_response :success
  end

  test "creates a new post" do
    user = create(:user)
    goal = create(:goal, user:)
    progress_change = create(:goal_progress_change, goal:)
    params = {
      post: attributes_for(:post)
    }

    sign_in user

    assert_difference "Entry.count", +1 do
      post goal_goal_progress_change_posts_path(goal_id: goal.id, goal_progress_change_id: progress_change.id), params: params
    end

    assert_response :redirect
    assert_redirected_to home_url
  end

  test "create returns a error response if the post is invalid" do
    user = create(:user)
    goal = create(:goal, user:)
    progress_change = create(:goal_progress_change, goal:)
    params = {
      post: attributes_for(:post, body: nil)
    }

    sign_in user

    assert_no_difference "Entry.count", 0 do
      post goal_goal_progress_change_posts_path(goal_id: goal.id, goal_progress_change_id: progress_change.id), params: params
    end

    assert_response :unprocessable_entity
  end
end
