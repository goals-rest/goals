require "test_helper"

class ApplicationComponentTest < ActiveSupport::TestCase
  test "merges attributes" do
    user_attrs = { value: "a" }

    application_component = ApplicationComponent.new(**user_attrs)

    assert_equal ({ value: "a" }), application_component.attrs
  end
end
