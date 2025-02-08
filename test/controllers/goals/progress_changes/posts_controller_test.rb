require "test_helper"

class Goals::ProgressChanges::PostsControllerTest < ActionDispatch::IntegrationTest
  test "new" do
    user = create(:user)
    goal = create(:goal, user:)
    progress_change = create(:goal_progress_change, goal:, new_value: goal.current + 1)

    sign_in user

    get new_goal_goal_progress_change_post_path(goal_id: goal.id, goal_progress_change_id: progress_change.id)

    assert_response :success
  end

  test "creates a new post" do
    user = create(:user)
    goal = create(:goal, user:)
    progress_change = create(:goal_progress_change, goal:, new_value: goal.current + 1)
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
    progress_change = create(:goal_progress_change, goal:, new_value: goal.current + 1)
    params = {
      post: attributes_for(:post, body: nil)
    }

    sign_in user

    assert_no_difference "Entry.count", 0 do
      post goal_goal_progress_change_posts_path(goal_id: goal.id, goal_progress_change_id: progress_change.id), params: params
    end

    assert_response :unprocessable_entity
  end

  test "can create post with images" do
    user = create(:user)
    goal = create(:goal, user:)
    progress_change = create(:goal_progress_change, goal:, new_value: goal.current + 1)
    params = {
      post: attributes_for(
        :post,
        images: [
          file_fixture_upload("avatar_placeholder.png", "image/png")
        ]
      )
    }

    sign_in user

    assert_difference("Post.count") do
      post goal_goal_progress_change_posts_path(goal_id: goal.id, goal_progress_change_id: progress_change.id), params: params
    end

    post = Post.last

    assert_response :redirect
    assert_redirected_to home_url
    assert_equal 1, post.images.count
  end
end
