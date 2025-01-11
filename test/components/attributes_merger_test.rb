require "test_helper"

class AttributeMergerTest < ActiveSupport::TestCase
  test "merges strings" do
    default_attrs = { value: "a" }
    user_attrs = { value: "b" }

    attribute_merger = AttributeMerger.new(default_attrs, user_attrs)

    assert_equal ({ value: "a b" }), attribute_merger.merge
  end

  test "merges arrays" do
    default_attrs = { value: [1] }
    user_attrs = { value: [2] }

    attribute_merger = AttributeMerger.new(default_attrs, user_attrs)

    assert_equal ({ value: [1, 2] }), attribute_merger.merge
  end

  test "merges hashes" do
    default_attrs = { value: { value: "a" } }
    user_attrs = { value: { value: "b" } }

    attribute_merger = AttributeMerger.new(default_attrs, user_attrs)

    assert_equal ({ value: { value: "a b" } }), attribute_merger.merge
  end

  test "keeps user attributes when values don't match type" do
    default_attrs = { value: "a" }
    user_attrs = { value: 2 }

    attribute_merger = AttributeMerger.new(default_attrs, user_attrs)

    assert_equal ({ value: 2 }), attribute_merger.merge
  end
end
