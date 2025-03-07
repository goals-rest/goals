module UI
  module ActivityCalendar
    class Preview < ViewComponent::Preview
      def playground
        date_range = Time.now.beginning_of_year.to_date..Time.now.end_of_year.to_date
        months = date_range.map(&:month).uniq

        render(UI::ActivityCalendar::Component.new(date_range)) do |activity_calendar|
          date_range.each do |date|
            activity_calendar.with_day(grade: UI::ActivityCalendar::DayComponent::GRADES.sample) do |day|
              I18n.localize(date)
            end
          end
        end
      end
    end
  end
end
