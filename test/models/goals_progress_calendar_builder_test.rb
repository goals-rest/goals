require "test_helper"

class GoalsProgressCalendarBuilderTest < ActiveSupport::TestCase
  test "builds a ProgressCalendar for a given user and date range" do
    user = create(:user)
    goal = create(:goal, user:)
    create(:goal_progress_change, goal:, created_at: Date.new(2025, 1, 1))

    goal2 = create(:goal, user:)
    create(:goal_progress_change, goal: goal2, created_at: Date.new(2025, 1, 2))
    create(:goal_progress_change, goal: goal2, created_at: Date.new(2025, 1, 2))

    builder = GoalsProgressCalendarBuilder.new(user)
    progress_calendar = builder.build(
      Date.new(2025, 1, 1).beginning_of_day..Date.new(2025, 1, 2).end_of_day
    )

    assert_equal Date.new(2025, 1, 1), progress_calendar.days.first.date
    assert_equal 1, progress_calendar.days.first.updates

    assert_equal Date.new(2025, 1, 2), progress_calendar.days.second.date
    assert_equal 2, progress_calendar.days.second.updates
  end

  test "builds a progress calendar and adds missing days from the aggregate" do
    user = create(:user)
    goal = create(:goal, user:)
    create(:goal_progress_change, goal:, created_at: Date.new(2025, 1, 1))

    goal2 = create(:goal, user:)
    create(:goal_progress_change, goal: goal2, created_at: Date.new(2025, 1, 3))
    create(:goal_progress_change, goal: goal2, created_at: Date.new(2025, 1, 3))

    builder = GoalsProgressCalendarBuilder.new(user)
    progress_calendar = builder.build(
      Date.new(2025, 1, 1).beginning_of_day..Date.new(2025, 1, 5).end_of_day
    )

    assert_equal Date.new(2025, 1, 1), progress_calendar.days[0].date
    assert_equal 1, progress_calendar.days[0].updates

    assert_equal Date.new(2025, 1, 2), progress_calendar.days[1].date
    assert_equal 0, progress_calendar.days[1].updates

    assert_equal Date.new(2025, 1, 3), progress_calendar.days[2].date
    assert_equal 2, progress_calendar.days[2].updates

    assert_equal Date.new(2025, 1, 4), progress_calendar.days[3].date
    assert_equal 0, progress_calendar.days[3].updates

    assert_equal Date.new(2025, 1, 5), progress_calendar.days[4].date
    assert_equal 0, progress_calendar.days[4].updates
  end
end
