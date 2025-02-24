module UI
  module ProgressCalendar
    class Preview < ViewComponent::Preview
      def playground
        days = (Time.now.beginning_of_year.to_date..Time.now.end_of_year.to_date).map do |date|
          ProgressCalendarDay.new(
            date:,
            updates: rand(0..10)
          )
        end

        progress_calendar = ::ProgressCalendar.new(days)
        render(UI::ProgressCalendar::Component.new(progress_calendar:))
      end
    end
  end
end
