require "test_helper"

class Entry::FragmentTest < ActiveSupport::TestCase
  test "validates type" do
    assert_raises(ArgumentError) { Entry::Fragment.new(2, "value") }
  end

  test "validates value" do
    assert_raises(ArgumentError) { Entry::Fragment.new(0, "") }
  end
end
