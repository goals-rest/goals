require "test_helper"

module UI
  module Toast
    class ComponentTest < ViewComponent::TestCase
      def test_renders_the_component
        render_inline(UI::Toast::Component.new) do |toast|
          toast.with_title.with_content("Toast Title")
          toast.with_description.with_content("Toast description.")
          toast.with_icon("check-circle", class: "size-6 text-green-500 dark:text-green:400")
            .with_content("Toast description.")
        end

        assert_text "Toast Title"
        assert_text "Toast description."
        assert_selector "svg", count: 2
      end
    end
  end
end
