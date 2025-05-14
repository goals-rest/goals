require "test_helper"

module Goals
  module UpdatesTimeline
    class ComponentTest < ViewComponent::TestCase
      test "renders" do
        goal1 = create(:goal, title: "Goal 1")
        create(:goal_progress_change, goal: goal1, new_value: 10, old_value: 0, target: 10)

        goal2 = create(:goal, title: "Goal 2")
        create(:goal_progress_change, goal: goal2, new_value: 20, old_value: 10, target: 30)

        goal3 = create(:goal, title: "Goal 3")
        create(:goal_progress_change, goal: goal3, new_value: 30, old_value: 20, target: 50)

        render_inline(Goals::UpdatesTimeline::Component.new(progress_changes: Goal::ProgressChange.all))

        assert_text "Goal 1"
        assert_text "Goal 2"
        assert_text "Goal 3"
      end
    end
  end
end
