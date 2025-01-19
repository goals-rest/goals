require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  test "#number_with_precision" do
    assert_equal "10,26", number_with_precision(10.256, precision: 2)
  end

  test "#strip_zeros" do
    assert_equal "10", strip_zeros(10.00)
    assert_equal "10,5", strip_zeros(10.5)
  end
end
