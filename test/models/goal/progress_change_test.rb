require "test_helper"

class Goal::ProgressChangeTest < ActiveSupport::TestCase
  should belong_to(:goal)

  should validate_presence_of(:old_value)
  should validate_presence_of(:new_value)
  should validate_presence_of(:target)

  test "log_change! creates a new progress change" do
    goal = create(:goal)

    assert_difference "Goal::ProgressChange.count", +1 do
      Goal::ProgressChange.log_change!(goal, 5, 10)
    end

    progress_change = Goal::ProgressChange.last

    assert_equal goal, progress_change.goal
    assert_equal 5, progress_change.old_value
    assert_equal 10, progress_change.new_value
  end

  test "diff returns the difference between the new value and the old value" do
    progress_change = Goal::ProgressChange.new(old_value: 5, new_value: 10)

    assert_equal 5, progress_change.diff
  end
end
