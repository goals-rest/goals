module UI
  module Tooltip
    class Preview < ViewComponent::Preview
      # @param placement select {{ UI::Tooltip::Component::PLACEMENTS }}
      def playground(placement: :top)
        render UI::Tooltip::Component.new(placement:) do |tooltip|
          tooltip.with_trigger.with_content("Hover me")
          tooltip.with_body.with_content("I'm a tooltip!")
        end
      end

      # @!group Placements
      def top
        render UI::Tooltip::Component.new(placement: :top) do |tooltip|
          tooltip.with_trigger.with_content("Top")
          tooltip.with_body.with_content("I'm a tooltip!")
        end
      end

      def right
        render UI::Tooltip::Component.new(placement: :right) do |tooltip|
          tooltip.with_trigger.with_content("Right")
          tooltip.with_body.with_content("I'm a tooltip!")
        end
      end

      def bottom
        render UI::Tooltip::Component.new(placement: :bottom) do |tooltip|
          tooltip.with_trigger.with_content("Bottom")
          tooltip.with_body.with_content("I'm a tooltip!")
        end
      end

      def left
        render UI::Tooltip::Component.new(placement: :left) do |tooltip|
          tooltip.with_trigger.with_content("Left")
          tooltip.with_body.with_content("I'm a tooltip!")
        end
      end
      # @!endgroup
    end
  end
end
