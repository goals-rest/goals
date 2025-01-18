require "test_helper"

module Form
  module TextField
    class ComponentTest < ViewComponent::TestCase
      test "renders the component" do
        render_inline(Form::TextField::Component.new)

        assert_selector "input[type='text']"
      end

      test "renders with invalid state" do
        render_inline(Form::TextField::Component.new(invalid: true))

        assert_selector ".form-input-error"
      end

      test "does not render with invalid state" do
        render_inline(Form::TextField::Component.new(invalid: false))

        assert_no_selector ".form-input-error"
      end
    end
  end
end
