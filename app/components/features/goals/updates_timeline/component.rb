module Goals
  module UpdatesTimeline
    class Component < ApplicationComponent
      attr_reader :progress_changes

      def initialize(progress_changes:)
        @progress_changes = progress_changes
      end
    end
  end
end
