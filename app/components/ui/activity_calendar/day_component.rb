module UI
  module ActivityCalendar
    class DayComponent < ApplicationComponent
      GRADES = %i[ none few some moderate many intense ].freeze

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

      attr_reader :grade

      def initialize(grade: :none, **attrs)
        raise ArgumentError, "Invalid grade: #{grade}" if GRADES.exclude?(grade)

        @grade = grade

        super(**attrs)
      end

      def classes
        style(grade:)
      end
    end
  end
end
