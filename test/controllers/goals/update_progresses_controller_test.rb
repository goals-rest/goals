require "test_helper"

module Goals
  class UpdateProgressesControllerTest < ActionDispatch::IntegrationTest
    test "new" do
      goal = create(:goal, current: 1, target: 5)

      sign_in goal.user

      get edit_goal_update_progress_url(goal), headers: { "Turbo-Frame" => "frame" }

      assert_response :success
    end

    test "when the request is not a turbo frame request redirects to root_url" do
      goal = create(:goal, current: 1, target: 5)

      sign_in goal.user

      get edit_goal_update_progress_url(goal, format: :html)

      assert_response :redirect
      assert_redirected_to root_url
    end

    test "updates the goal current value" do
      goal = create(:goal, current: 1, target: 5)
      params = {
        goal: {
          current: 2
        }
      }

      sign_in goal.user

      patch goal_update_progress_url(goal), params: params

      goal.reload

      assert_equal 2, goal.current
    end

    test "redirects to goals_url" do
      goal = create(:goal, current: 1, target: 5)
      params = {
        goal: {
          current: 2
        }
      }

      sign_in goal.user

      patch goal_update_progress_url(goal), params: params

      assert_response :redirect
      assert_redirected_to goals_url
    end
  end
end
