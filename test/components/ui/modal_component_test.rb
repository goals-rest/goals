require "test_helper"

module UI
  module Modal
    class ComponentTest < ViewComponent::TestCase
      def test_renders_the_component
        render_inline(UI::Modal::Component.new) do |modal|
          [
            modal.render(UI::Modal::HeaderComponent.new) do |header|
              header.render(UI::Modal::HeaderTitleComponent.new.with_content("Modal Title"))
            end,
            modal.render(UI::Modal::BodyComponent.new.with_content("Modal Body")),
            "Content"
          ].join("\n").html_safe
        end

        assert_text "Modal Title"
        assert_text "Modal Body"
        assert_text "Content"
      end
    end
  end
end
