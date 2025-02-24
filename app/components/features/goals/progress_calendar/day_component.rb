module Goals
  module ProgressCalendar
    class DayComponent < ApplicationComponent
      style do
        base do
          %w[ rounded-sm w-full h-full ]
        end

        variants do
          color {
            level0 {
              "bg-zinc-100 dark:bg-zinc-800"
            }

            level1 {
              "bg-primary-200 dark:bg-primary-300"
            }

            level2 {
              "bg-primary-300 dark:bg-primary-400"
            }

            level3 {
              "bg-primary-400 dark:bg-primary-500"
            }

            level4 {
              "bg-primary-500 dark:bg-primary-600"
            }

            level5 {
              "bg-primary-600 dark:bg-primary-700"
            }
          }
        end
      end

      attr_reader :day

      def initialize(day:, **attrs)
        @day = day
      end

      def classes
        style(color: day_color)
      end

      private
      def day_color
        if day.updates.zero?
          :level0
        elsif day.updates <= 4
          :level1
        elsif day.updates <= 9
          :level2
        elsif day.updates <= 14
          :level3
        elsif day.updates <= 20
          :level4
        elsif day.updates > 20
          :level5
        end
      end
    end
  end
end
