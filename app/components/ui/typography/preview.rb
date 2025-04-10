module UI
  module Typography
    class Preview < ViewComponent::Preview
      # @param as text
      # @param variant select {{ UI::Typography::Component::VARIANTS }}
      # @param color select {{ UI::Typography::Component::COLORS }}
      # @param text text
      # @param no_wrap toggle
      def playground(as: :span, variant: :body1, color: :text_primary, text: "A typography component", no_wrap: false)
        render UI::Typography::Component.new(as:, variant:, color:, no_wrap:).with_content(text)
      end

      # @!group Variants
      # @param text text
      # @param color select {{ UI::Typography::Component::COLORS }}
      def h1(text: "A typography component", color: :text_primary)
        render UI::Typography::Component.new(as: :h1, variant: :h1, color:).with_content(text)
      end

      def h2(text: "A typography component", color: :text_primary)
        render UI::Typography::Component.new(as: :h2, variant: :h2, color:).with_content(text)
      end

      def h3(text: "A typography component", color: :text_primary)
        render UI::Typography::Component.new(as: :h3, variant: :h3, color:).with_content(text)
      end

      def h4(text: "A typography component", color: :text_primary)
        render UI::Typography::Component.new(as: :h4, variant: :h4, color:).with_content(text)
      end

      def h5(text: "A typography component", color: :text_primary)
        render UI::Typography::Component.new(as: :h5, variant: :h5, color:).with_content(text)
      end

      def h6(text: "A typography component", color: :text_primary)
        render UI::Typography::Component.new(as: :h6, variant: :h6, color:).with_content(text)
      end

      def subtitle1(text: "A typography component", color: :text_primary)
        render UI::Typography::Component.new(as: :span, variant: :subtitle1, color:).with_content(text)
      end

      def subtitle2(text: "A typography component", color: :text_primary)
        render UI::Typography::Component.new(as: :span, variant: :subtitle2, color:).with_content(text)
      end

      def body1(text: "A typography component", color: :text_primary)
        render UI::Typography::Component.new(as: :span, variant: :body1, color:).with_content(text)
      end

      def body2(text: "A typography component", color: :text_primary)
        render UI::Typography::Component.new(as: :span, variant: :body2, color:).with_content(text)
      end

      def caption(text: "A typography component", color: :text_primary)
        render UI::Typography::Component.new(as: :span, variant: :caption, color:).with_content(text)
      end
      # @!endgroup
    end
  end
end
