module Goals
  module ProgressIndicator
    class Preview < ViewComponent::Preview
      def playground
        progress_change = Goal::ProgressChange.new(old_value: 5, new_value: 10, target: 20)
        render(Goals::ProgressIndicator::Component.new(progress_change:))
      end

      # @!group Colors
      def positive_progress
        progress_change = Goal::ProgressChange.new(old_value: 5, new_value: 10, target: 20)
        render(Goals::ProgressIndicator::Component.new(progress_change:))
      end

      def negative_progress
        progress_change = Goal::ProgressChange.new(old_value: 10, new_value: 5, target: 20)
        render(Goals::ProgressIndicator::Component.new(progress_change:))
      end

      def no_progress
        progress_change = Goal::ProgressChange.new(old_value: 5, new_value: 5, target: 20)
        render(Goals::ProgressIndicator::Component.new(progress_change:))
      end
      # @!endgroup
    end
  end
end
