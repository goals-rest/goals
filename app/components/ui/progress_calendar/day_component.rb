module UI
  module ProgressCalendar
    class DayComponent < ApplicationComponent
      style do
        base do
          %w[ rounded-sm w-full h-full ]
        end

        variants do
          grade {
            none {
              "bg-zinc-100 dark:bg-zinc-800"
            }

            few {
              "bg-primary-200 dark:bg-primary-300"
            }

            some {
              "bg-primary-300 dark:bg-primary-400"
            }

            moderate {
              "bg-primary-400 dark:bg-primary-500"
            }

            many {
              "bg-primary-500 dark:bg-primary-600"
            }

            intense {
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
        style(grade: day.grade)
      end
    end
  end
end
