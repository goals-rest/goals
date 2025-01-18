module UI
  module ProgressBar
    class Component < ApplicationComponent
      style :wrapper do
        base do
          %w[
            w-full rounded-full bg-zinc-200 dark:bg-zinc-700
          ]
        end

        variants {
          size {
            sm { "h-1.5" }
            base { "h-2.5" }
            lg { "h-4" }
            xl { "h-6" }
          }
        }

        defaults { { size: :base } }
      end

      style do
        base do
          %w[
            rounded-full
          ]
        end

        variants {
          color {
            primary { "bg-primary-600 dark:bg-primary-500" }
            secondary { "bg-secondary-600 dark:bg-secondary-500" }
            dark { "bg-zinc-600 dark:bg-zinc-500" }
          }

          size {
            sm { "h-1.5" }
            base { "h-2.5" }
            lg { "h-4" }
            xl { "h-6" }
          }
        }

        defaults { { color: :primary, size: :base } }
      end

      attr_reader :progress, :color, :size, :wrapper_attrs

      def initialize(progress: 0, color: nil, size: nil, wrapper_attrs: {}, **user_attrs)
        @progress = progress.to_f.round(2)
        @color = color
        @size = size
        @wrapper_attrs = AttributeMerger.new(default_wrapper_attrs, wrapper_attrs).merge

        super(**user_attrs)
      end


      def progress_in_percentage
        progress * 100
      end

      def default_attrs
        {
          class: style(color:, size:),
          style: "width: #{progress_in_percentage}%"
        }
      end

      private
      def default_wrapper_attrs
        {
          class: style(:wrapper, size:)
        }
      end
    end
  end
end
