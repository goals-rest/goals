require "test_helper"

module UI
  module Flash
    class ComponentTest < ViewComponent::TestCase
      test "renders the component" do
        render_inline UI::Flash::Component.new(type: :notice)
          .with_content("Alert message")

        assert_text "Alert message"
        assert_selector "[role='alert']"
      end

      test "renders the component with type :notice" do
        render_inline UI::Flash::Component.new(type: :notice)
          .with_content("Alert message")

        assert_text "Alert message"
        assert_selector ".bg-secondary-600"
      end

      test "renders the component with type :alert" do
        render_inline UI::Flash::Component.new(type: :alert)
          .with_content("Alert message")

        assert_text "Alert message"
        assert_selector ".bg-primary-500"
      end

      test "renders the component with controller flash" do
        render_inline UI::Flash::Component.new(type: :alert, auto_hide: true)
          .with_content("Alert message")

        assert_text "Alert message"
        assert_selector "div[data-controller='flash']"
      end
    end
  end
end
