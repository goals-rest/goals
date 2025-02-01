require "test_helper"

class GoalTest < ActiveSupport::TestCase
  context "validations" do
    subject { build(:goal) }

    should validate_presence_of(:title)
    should validate_presence_of(:current)
    should validate_presence_of(:target)

    should validate_length_of(:title).is_at_most(60)
    should validate_length_of(:description).is_at_most(100)

    should "validates start_date presence" do
      goal = Goal.new(start_date: Time.zone.today)

      assert goal.errors[:start_date].blank?
    end

    context "when the end_date is before the start_date" do
      should "returns an error" do
        goal = Goal.new(start_date: Time.zone.today, end_date: Time.zone.yesterday)

        assert_not goal.valid?
        assert_includes goal.errors[:end_date], I18n.t("activerecord.errors.models.goal.before_start_date")
      end
    end
  end

  context "scopes" do
    context ".search" do
      context "when the goal with the given title is found" do
        should "returns the founded goal" do
          goal_a = create(:goal, title: "Goal A")
          goal_b = create(:goal, title: "Goal B")

          result = Goal.search("B")


          assert_includes result, goal_b
        end
      end

      context "when the goal with the given title is not found" do
        should "returns an empty array" do
          goal_a = create(:goal, title: "Goal A")
          goal_b = create(:goal, title: "Goal B")

          result = Goal.search("C")

          assert_empty result
        end
      end
    end
  end

  context "instance methods" do
    context ".progress" do
      should "returns the progress of the goal" do
        goal = create(:goal, current: 50, target: 100)

        result = goal.progress

        assert_equal result, 0.5
      end
    end

    context ".translated_status" do
      should "returns the translated status name" do
        goal = build(:goal, status: :completed)

        assert_equal I18n.t("activerecord.attributes.goal.status.completed"), goal.translated_status
      end
    end
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
end
