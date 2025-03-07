module Goals
  module ProgressCalendar
    class Component < ApplicationComponent
      attr_reader :progress_calendar

      def initialize(progress_calendar:, **attrs)
        @progress_calendar = progress_calendar

        super(**attrs)
      end

      private
      def calendar_date_range
        first_day = progress_calendar.days.first
        last_day = progress_calendar.days.last

        first_day.date..last_day.date
      end

      def tooltip_content_for(day)
        t(".updates", count: day.updates, date: I18n.localize(day.date, format: :short_month))
      end
    end
  end
end
