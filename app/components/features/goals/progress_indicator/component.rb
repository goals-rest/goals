module Goals
  module ProgressIndicator
    class Component < ApplicationComponent
      delegate :strip_zeros, to: :helpers

      attr_reader :progress_change

      def initialize(progress_change:)
        @progress_change = progress_change
      end
    end
  end
end
