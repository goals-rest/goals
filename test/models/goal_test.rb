require "test_helper"

class GoalTest < ActiveSupport::TestCase
  should validate_presence_of(:title)
  should validate_presence_of(:current)
  should validate_presence_of(:target)

  should validate_length_of(:title).is_at_most(60)
  should validate_length_of(:description).is_at_most(100)
  should validate_numericality_of(:current)

  should define_enum_for(:status)
  should define_enum_for(:visibility)

  test "start_date presence" do
    goal = Goal.new(start_date: Time.zone.today)

    assert goal.errors[:start_date].blank?
  end

  test "returns an error when the end_date is before the start_date" do
    goal = Goal.new(start_date: Time.zone.today, end_date: Time.zone.yesterday)

    assert_not goal.valid?
    assert_includes goal.errors[:end_date], I18n.t("activerecord.errors.models.goal.before_start_date")
  end

  test "search returns the founded goal when the goal with the given title is found" do
    goal_a = create(:goal, title: "Goal A")
    goal_b = create(:goal, title: "Goal B")

    result = Goal.search("B")

    assert_includes result, goal_b
  end

  test "search returns an empty array when the goal with the given title is not found" do
    goal_a = create(:goal, title: "Goal A")
    goal_b = create(:goal, title: "Goal B")

    result = Goal.search("C")

    assert_empty result
  end

  test "progress returns the progress of the goal" do
    goal = Goal.new(current: 50, target: 100)

    result = goal.progress

    assert_equal result, 0.5
  end

  test "progress returns 0 if target is 0" do
    goal = create(:goal, current: 50, target: 0)

    assert_equal 0, goal.progress
  end

  test "translated_status returns the translated status name" do
    goal = Goal.new(status: :completed)

    assert_equal I18n.t("activerecord.attributes.goal.status.completed"), goal.translated_status
  end

  test "changes status to completed when current is bigger than or equal to target" do
    goal = create(:goal, current: 1, target: 5)
    goal.update(current: 5)

    assert goal.completed?
  end

  test "changes status to pending when current is less than to target" do
    goal = create(:goal, current: 5, target: 5, status: :completed)
    goal.update(current: 1)

    assert goal.pending?
  end

  test "creates a goal progress change if current changes" do
    goal = create(:goal, current: 5, target: 10)

    assert_difference "Goal::ProgressChange.count", +1 do
      goal.update(current: 10)
    end

    goal.reload

    progress_change = goal.progress_changes.last

    assert_equal 5, progress_change.old_value
    assert_equal 10, progress_change.new_value
    assert_equal 10, progress_change.target
  end

  test "does not create a goal progress change if current does not change" do
    goal = create(:goal, current: 5, target: 10)

    assert_no_difference "Goal::ProgressChange.count", 0 do
      goal.update(target: 20)
    end
  end

  test "updates the goal progress" do
    goal = create(:goal, current: 5, target: 10)

    assert goal.update_progress(10)
    assert_equal 10, goal.reload.current
  end

  test "does not update the goal progress if new current is equal to current" do
    goal = create(:goal, current: 5, target: 10)

    assert_not goal.update_progress(5)
  end
end
