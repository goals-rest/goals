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
        assert_includes goal.errors[:end_date], "não pode ser menor do que a data de início"
      end
    end
  end
end
