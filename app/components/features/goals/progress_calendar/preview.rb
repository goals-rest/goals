module Goals
  module ProgressCalendar
    class Preview < ViewComponent::Preview
      def playground
        days = (Time.now.beginning_of_year.to_date..Time.now.end_of_year.to_date).map do |date|
          GoalsProgressCalendarDay.new(
            date:,
            updates: rand(0..10)
          )
        end

        goals_progress_calendar = GoalsProgressCalendar.new(days)
        render(Goals::ProgressCalendar::Component.new(goals_progress_calendar:))
      end
    end
  end
end
