module UI
  module ProgressCalendar
    class Component < ApplicationComponent
      MONTH_CSS_COLUMNS = [ 4, 4, 4, 5, 4, 4, 5, 4, 4, 5, 4, 5 ].freeze

      attr_reader :calendar

      def initialize(progress_calendar:, **attrs)
        @calendar = progress_calendar

        super(**attrs)
      end

      private
      def month_numbers
        start_month = @calendar.days.first.date
        end_month = @calendar.days.last.date

        (start_month..end_month).map { it.month }.uniq
      end

      def month_names
        month_numbers.map do |month|
          I18n.t("date.abbr_month_names")[month].capitalize
        end
      end

      def week_day_names
        [ nil, 1, nil, 3, nil, 5, nil ].map do |day|
          next if day.blank?

          I18n.t("date.abbr_day_names")[day].capitalize
        end
      end

      def month_grid_template_column_classes
        month_numbers.map do |month|
          "calc(var(--week-width) * #{MONTH_CSS_COLUMNS[month - 1]})"
        end.join(" ")
      end
    end
  end
end
