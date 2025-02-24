class GoalsProgressCalendarBuilder
  def initialize(user)
    @user = user
  end

  def build(range, **args)
    progresses = DailyGoalsProgress
      .where(
        goal_progress_changes: { created_at: range },
        goal: { user_id: @user.id },
        **args
      )
      .group_by(&:date)

    ProgressCalendar.new(days_for(progresses, range))
  end

  private
  def days_for(progresses, range)
    (range.first.to_date..range.last.to_date).map do |date|
      progress = progresses.fetch(date, []).first

      ProgressCalendarDay.new(
        date:,
        updates: progress ? progress.updates : 0
      )
    end
  end
end
