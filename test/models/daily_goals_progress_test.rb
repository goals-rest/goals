require "test_helper"

class DailyGoalsProgressTest < ActiveSupport::TestCase
  test "the query result is mapped to an array of DailyGoalsProgress" do
    goal = create(:goal)
    create(:goal_progress_change, goal:)

    assert_instance_of DailyGoalsProgress, DailyGoalsProgress.where.first
  end

  test "the goal progress changes are grouped by date and user id" do
    # user 1
    user1 = create(:user)

    goal1 = create(:goal, user: user1)
    create(:goal_progress_change, goal: goal1, created_at: Date.new(2025, 1, 1))

    goal2 = create(:goal, user: user1)
    create(:goal_progress_change, goal: goal2, created_at: Date.new(2025, 1, 1))

    goal2 = create(:goal, user: user1)
    create(:goal_progress_change, goal: goal2, created_at: Date.new(2025, 1, 2))

    # user 2
    user2 = create(:user)

    goal3 = create(:goal, user: user2)
    create(:goal_progress_change, goal: goal3, created_at: Date.new(2025, 1, 1))

    expected_result = [
      {
        date: Date.new(2025, 1, 1),
        updates: 2,
        user_id: user1.id
      },
      {
        date: Date.new(2025, 1, 2),
        updates: 1,
        user_id: user1.id
      },
      {
        date: Date.new(2025, 1, 1),
        updates: 1,
        user_id: user2.id
      }
    ]

    result = DailyGoalsProgress.where.map do
      {
        date: it.date,
        updates: it.updates,
        user_id: it.user_id
      }
    end

    assert_equal 3, result.size
    assert_equal expected_result.to_set, result.to_set
  end

  test "the result aggregates goal progress change ocurrences for each day" do
    # user 1
    user1 = create(:user)

    goal1 = create(:goal, user: user1)
    create(:goal_progress_change, goal: goal1, created_at: Date.new(2025, 1, 1))

    goal2 = create(:goal, user: user1)
    create(:goal_progress_change, goal: goal2, created_at: Date.new(2025, 1, 1))

    goal3 = create(:goal, user: user1)
    create(:goal_progress_change, goal: goal3, created_at: Date.new(2025, 1, 2))

    result = DailyGoalsProgress.where.sort_by { it.date }

    assert_equal 2, result.size

    assert_equal Date.new(2025, 1, 1), result.first.date
    assert_equal 2, result.first.updates

    assert_equal Date.new(2025, 1, 2), result.second.date
    assert_equal 1, result.second.updates
  end

  test "results can be filtered by user id" do
    # user 1
    user1 = create(:user)

    goal1 = create(:goal, user: user1)
    create(:goal_progress_change, goal: goal1, created_at: Date.new(2025, 1, 1))

    goal2 = create(:goal, user: user1)
    create(:goal_progress_change, goal: goal2, created_at: Date.new(2025, 1, 1))

    goal2 = create(:goal, user: user1)
    create(:goal_progress_change, goal: goal2, created_at: Date.new(2025, 1, 2))

    # user 2
    user2 = create(:user)

    goal3 = create(:goal, user: user2)
    create(:goal_progress_change, goal: goal3, created_at: Date.new(2025, 1, 1))

    expected_result = [
      {
        date: Date.new(2025, 1, 1),
        updates: 1,
        user_id: user2.id
      }
    ]

    result = DailyGoalsProgress.where(goal: { user_id: user2.id }).map do
      {
        date: it.date,
        updates: it.updates,
        user_id: it.user_id
      }
    end

    assert_equal 1, result.size
    assert_equal expected_result.to_set, result.to_set
  end
end
