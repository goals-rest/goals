module Goals
  module ProgressCalendar
    class Preview < ViewComponent::Preview
      def playground
        days = (11.months.ago.beginning_of_month.to_date..Time.zone.now.end_of_month.to_date).map do |date|
          ProgressCalendarDay.new(
            date:,
            updates: rand(1..10)
          )
        end

        progress_calendar = ::ProgressCalendar.new(days)

        render(Goals::ProgressCalendar::Component.new(progress_calendar:))
      end
    end
  end
end
