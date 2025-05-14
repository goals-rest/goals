require "test_helper"

class GoalProgressChangePolicyTest < ActiveSupport::TestCase
  test "the default scope lists all progress changes when the current user is the profile owner" do
    user = create(:user)
    public_goal = create(:goal, :public, user:)
    private_goal = create(:goal, :private, user:)

    public_progress_change = create(:goal_progress_change, goal: public_goal)
    private_progress_change = create(:goal_progress_change, goal: private_goal)

    policy = Profiles::GoalProgressChangePolicy.new(user:, profile_owner: user)
    progress_changes = policy.apply_scope(Goal::ProgressChange.all, type: :active_record_relation)

    assert_equal [ public_progress_change, private_progress_change ], progress_changes
  end

  test "the default scope lists only public progress changes when the current user is not the profile owner" do
    user = create(:user)
    other_user = create(:user)
    public_goal = create(:goal, :public, user: other_user)
    private_goal = create(:goal, :private, user: other_user)

    public_progress_change = create(:goal_progress_change, goal: public_goal)
    _private_progress_change = create(:goal_progress_change, goal: private_goal)

    policy = Profiles::GoalProgressChangePolicy.new(user:, profile_owner: other_user)
    progress_changes = policy.apply_scope(Goal::ProgressChange.all, type: :active_record_relation)

    assert_equal [ public_progress_change ], progress_changes
  end

  test "the default scope lists only public progress changes when the current user is nil" do
    user = nil
    profile_owner = create(:user)
    public_goal = create(:goal, :public, user: profile_owner)
    private_goal = create(:goal, :private, user: profile_owner)

    public_progress_change = create(:goal_progress_change, goal: public_goal)
    _private_progress_change = create(:goal_progress_change, goal: private_goal)

    policy = Profiles::GoalProgressChangePolicy.new(user:, profile_owner:)
    progress_changes = policy.apply_scope(Goal::ProgressChange.all, type: :active_record_relation)

    assert_equal [ public_progress_change ], progress_changes
  end
end
