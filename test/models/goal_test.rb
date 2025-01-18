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
  end
end
