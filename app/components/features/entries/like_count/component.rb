module Entries
  module LikeCount
    class Component < ApplicationComponent
      attr_reader :entry

      def initialize(entry:, **attrs)
        @entry = entry

        super(**attrs)
      end
    end
  end
end
