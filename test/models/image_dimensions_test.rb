require "test_helper"

class ImageDimensionsTest < ActiveSupport::TestCase
  test "returns the aspect ratio" do
    image_dimensions = ImageDimensions.new(800, 400)

    assert_equal 2.0, image_dimensions.aspect_ratio
  end

  test "matches square aspect ratio if aspect ratio is greater than 0.8 and less than 1.25" do
    image_dimensions = ImageDimensions.new(400, 400)

    assert image_dimensions.square?
  end

  test "does not match square aspect ratio if aspect ratio is less than or equal to 0.8" do
    image_dimensions = ImageDimensions.new(400, 800)

    assert_not image_dimensions.square?
  end

  test "does not match square aspect ratio if aspect ratio is equal to or bigger than 1.25" do
    image_dimensions = ImageDimensions.new(1280, 728)

    assert_not image_dimensions.square?
  end

  test "matches portrait aspect ratio if aspect ratio is less than or equal to 0.8" do
    image_dimensions = ImageDimensions.new(400, 800)

    assert image_dimensions.portrait?
  end

  test "does not match portrait aspect ratio if aspect ratio is equal to or bigger than 1.25" do
    image_dimensions = ImageDimensions.new(1280, 728)

    assert_not image_dimensions.portrait?
  end

  test "does not match portrait aspect ratio if aspect ratio is less than or equal to 0.8" do
    image_dimensions = ImageDimensions.new(400, 400)

    assert_not image_dimensions.portrait?
  end

  test "matches landscape aspect ratio if aspect ratio is bigger than or equal to 1.25" do
    image_dimensions = ImageDimensions.new(1280, 728)

    assert image_dimensions.landscape?
  end

  test "does not match landscape aspect ratio if aspect ratio is bigger than 0.8 or less than 1.25" do
    image_dimensions = ImageDimensions.new(400, 400)

    assert_not image_dimensions.landscape?
  end

  test "does not match landscape aspect ratio if aspect ratio is less than or equal to 0.8" do
    image_dimensions = ImageDimensions.new(400, 800)

    assert_not image_dimensions.landscape?
  end
end
