module UI
  module Button
    class Preview < ViewComponent::Preview
      # @param text
      # @param builder select { choices: [ button, a ] }
      # @param variant select { choices: [ default, rounded] }
      # @param color select { choices: [ primary, secondary, dark, light, white, transparent, link ] }
      # @param size select { choices: [ sm, base, lg ] }
      def playground(builder: :button, variant: :default, text: "Default Button", color: :primary, size: :base)
        render(UI::Button::Component.new(builder:, variant:, color:, size:)) do
          text
        end
      end

      def with_leading_icon
        render(UI::Button::Component.new) do |button|
          button.with_leading_icon("plus-circle")

          "Button"
        end
      end

      def with_trailing_icon
        render(UI::Button::Component.new) do |button|
          button.with_trailing_icon("plus-circle")

          "Button"
        end
      end

      # @param text
      # @param builder select { choices: [ button, a ] }
      # @param variant select { choices: [ default, rounded] }
      # @param color select { choices: [ primary, secondary, dark, light, white, transparent, link ] }
      # @param size select { choices: [ sm, base, lg ] }
      def rounded(builder: :button, variant: :rounded, text: nil, color: :primary, size: :base)
        render(UI::Button::Component.new(builder:, variant:, color:, size:)) do |button|
          button.with_trailing_icon("trash", class: "size-6")
        end
      end

      # @param text
      # @param builder select { choices: [ button, a ] }
      # @param variant select { choices: [ default, rounded, rounded_outlined] }
      # @param color select { choices: [ primary, secondary, dark, light, white, transparent, link ] }
      # @param size select { choices: [ sm, base, lg ] }
      def rounded_outlined(builder: :button, variant: :rounded_outlined, text: nil, color: :primary, size: :base)
        render(UI::Button::Component.new(builder:, variant:, color:, size:)) do |button|
          button.with_trailing_icon("trash", class: "size-6")
        end
      end

      # @!group Sizes

      # Small UI::Button
      def small
        render(UI::Button::Component.new(size: :sm, color: :primary)) do
          "Small Button"
        end
      end

      # Base UI::Button
      def base
        render(UI::Button::Component.new(size: :base, color: :primary)) do
          "Base Button"
        end
      end

      # Large UI::Button
      def large
        render(UI::Button::Component.new(size: :lg, color: :primary)) do
          "Large Button"
        end
      end

      # @!endgroup

      # @!group Colors

      # Primary UI::Button
      def primary
        render(UI::Button::Component.new(color: :primary, size: :base)) do
          "Primary Button"
        end
      end

      # Secondary UI::Button
      def secondary
        render(UI::Button::Component.new(color: :secondary, size: :base)) do
          "Secondary Button"
        end
      end

      # Dark UI::Button
      def dark
        render(UI::Button::Component.new(color: :dark, size: :base)) do
          "Dark Button"
        end
      end

      # Light UI::Button
      def light
        render(UI::Button::Component.new(color: :light, size: :base)) do
          "Light Button"
        end
      end

      # White UI::Button
      def white
        render(UI::Button::Component.new(color: :white, size: :base)) do
          "White Button"
        end
      end

      # Transparent UI::Button
      def transparent
        render(UI::Button::Component.new(color: :transparent, size: :base)) do
          "Transparent Button"
        end
      end

      # Link UI::Button
      def link
        render(UI::Button::Component.new(color: :link, size: :base)) do
          "Link Button"
        end
      end

      # @!endgroup
    end
  end
end
