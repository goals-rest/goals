module UI
  module Icon
    class Preview < ViewComponent::Preview
      # @param name select :icons_list
      # @param variant select {{ UI::Icon::Component::VARIANTS }}
      # @param color select { choices: [ primary, secondary, dark, light, white, transparent, link ] }
      # @param size select { choices: [ xs, sm, base, lg ] }
      def playground(name: "user", variant: :outline, color: :primary, size: :base)
        render(UI::Icon::Component.new(name, variant:, color:, size:))
      end

      # @!group Sizes

      # Extra Small Icon
      def extra_small
        render(UI::Icon::Component.new("user", size: :xs, color: :primary))
      end

      # Small Icon
      def small
        render(UI::Icon::Component.new("user", size: :sm, color: :primary))
      end

      # Base Icon
      def base
        render(UI::Icon::Component.new("user", size: :base, color: :primary))
      end

      # Large Icon
      def large
        render(UI::Icon::Component.new("user", size: :lg, color: :primary))
      end

      # @!endgroup

      # @!group Colors

      # Primary Icon
      def primary
        render(UI::Icon::Component.new("user", color: :primary, size: :base))
      end

      # Secondary Icon
      def secondary
        render(UI::Icon::Component.new("user", color: :secondary, size: :base))
      end

      # Dark Icon
      def dark
        render(UI::Icon::Component.new("user", color: :dark, size: :base))
      end

      # Light Icon
      def light
        render(UI::Icon::Component.new("user", color: :light, size: :base))
      end

      # White Icon
      def white
        render(UI::Icon::Component.new("user", color: :white, size: :base))
      end

      # Transparent Icon
      def transparent
        render(UI::Icon::Component.new("user", color: :transparent, size: :base))
      end

      # Link Icon
      def link
        render(UI::Icon::Component.new("user", color: :link, size: :base))
      end

      # @!endgroup

      private
      def icons_list
        folder_path = RailsuiIcon::Engine.root.join("lib", "railsui_icon", "icons")

        Dir.glob("#{folder_path}/**/*.svg").map do |file|
          File.basename(file, ".svg")
        end
      end
    end
  end
end
