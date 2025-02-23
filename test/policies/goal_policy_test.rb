require "test_helper"

class GoalPolicyTest < ActiveSupport::TestCase
  test "edit? returns true if user owns the goal" do
    user = build_stubbed(:user)
    goal = build_stubbed(:goal, user:)

    policy = GoalPolicy.new(goal, user:)

    assert policy.edit?
  end

  test "edit? returns false if user does not own the goal" do
    user = build_stubbed(:user)
    user2 = build_stubbed(:user)
    goal = build_stubbed(:goal, user: user2)

    policy = GoalPolicy.new(goal, user:)

    assert_not policy.edit?
  end
end
