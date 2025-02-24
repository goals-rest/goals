module UI
  module ActivityCalendar
    class Component < ApplicationComponent
      MONTH_TO_GRID_COLUMNS = [ 4, 4, 4, 5, 4, 4, 5, 4, 4, 5, 4, 5 ].freeze

      renders_many :days, DayComponent

      attr_reader :date_range

      def initialize(date_range, **attrs)
        @date_range = date_range

        super(**attrs)
      end

      private
      def months
        date_range.map(&:month).uniq
      end

      def month_names
        months.map do |month|
          I18n.t("date.abbr_month_names")[month].capitalize
        end
      end

      def month_grid_template_column_classes
        months.map do |month|
          "calc(var(--week-width) * #{MONTH_TO_GRID_COLUMNS[month - 1]})"
        end.join(" ")
      end

      def week_day_names
        [ nil, 1, nil, 3, nil, 5, nil ].map do |week_day_index|
          next if week_day_index.blank?

          I18n.t("date.abbr_day_names")[week_day_index].capitalize
        end
      end
    end
  end
end
