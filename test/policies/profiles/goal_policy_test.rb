require "test_helper"

module Profiles
  class GoalPolicyTest < ActiveSupport::TestCase
    test "the default scope lists public and private goals when the current user is the profile owner" do
      user = create(:user)
      public_goal = create(:goal, :public, user:)
      private_goal = create(:goal, :private, user:)

      policy = Profiles::GoalPolicy.new(user:, profile_owner: user)
      goals = policy.apply_scope(Goal.all, type: :active_record_relation)

      assert_equal [ public_goal, private_goal ], goals
    end

    test "the default scope lists goals from the profile owner only" do
      user = create(:user)
      public_goal = create(:goal, :public, user:)
      private_goal = create(:goal, :private, user:)

      create(:goal)

      policy = Profiles::GoalPolicy.new(user:, profile_owner: user)
      goals = policy.apply_scope(Goal.all, type: :active_record_relation)

      assert_equal [ public_goal, private_goal ], goals
    end

    test "guest users can only see public goals" do
      user = create(:user)
      public_goal = create(:goal, :public, user:)
      _private_goal = create(:goal, :private, user:)

      create(:goal)

      policy = Profiles::GoalPolicy.new(user: nil, profile_owner: user)
      goals = policy.apply_scope(Goal.all, type: :active_record_relation)

      assert_equal [ public_goal ], goals
    end

    test "other users can only see public goals" do
      user = create(:user)
      other_user = create(:user)
      public_goal = create(:goal, :public, user:)
      _private_goal = create(:goal, :private, user:)

      create(:goal)

      policy = Profiles::GoalPolicy.new(user: other_user, profile_owner: user)
      goals = policy.apply_scope(Goal.all, type: :active_record_relation)

      assert_equal [ public_goal ], goals
    end
  end
end
