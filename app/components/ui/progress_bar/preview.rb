module UI
  module ProgressBar
    class Preview < ViewComponent::Preview
      # @param progress number 0.5
      # @param color select { choices: [ primary, secondary, dark ] }
      # @param size select { choices: [ base ] }
      def playground(progress: 0.5, color: :primary, size: :base)
        render UI::ProgressBar::Component.new(progress:, color:, size:)
      end

      # @!group Sizes
      def small
        render UI::ProgressBar::Component.new(progress: 0.5, size: :sm)
      end

      def base
        render UI::ProgressBar::Component.new(progress: 0.5, size: :base)
      end

      def large
        render UI::ProgressBar::Component.new(progress: 0.5, size: :lg)
      end

      def extra_large
        render UI::ProgressBar::Component.new(progress: 0.5, size: :xl)
      end
      # @endgroup


      # @!group Colors
      def primary
        render UI::ProgressBar::Component.new(progress: 0.5, color: :primary)
      end

      def secondary
        render UI::ProgressBar::Component.new(progress: 0.5, color: :secondary)
      end

      def dark
        render UI::ProgressBar::Component.new(progress: 0.5, color: :dark)
      end
      # @endgroup
    end
  end
end
