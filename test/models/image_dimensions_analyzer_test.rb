require "test_helper"

class ImageDimensionsAnalyzerTest < ActiveSupport::TestCase
  test "returns nil if the attachment has not been analyzed" do
    attachment = Minitest::Mock.new
    attachment.expect :analyzed?, false

    analyzer = ImageDimensionsAnalyzer.new(attachment)

    image_dimensions = analyzer.analyze

    assert attachment.verify
    assert_instance_of NullImageDimensions, image_dimensions
  end

  test "returns nil if the attachment has width equals nil" do
    attachment = Minitest::Mock.new
    attachment.expect :analyzed?, true
    attachment.expect :metadata, { width: nil }

    analyzer = ImageDimensionsAnalyzer.new(attachment)

    image_dimensions = analyzer.analyze

    assert attachment.verify
    assert_instance_of NullImageDimensions, image_dimensions
  end

  test "returns nil if the attachment has width equals 0" do
    attachment = Minitest::Mock.new
    attachment.expect :analyzed?, true
    attachment.expect :metadata, { width: 0 }

    analyzer = ImageDimensionsAnalyzer.new(attachment)

    image_dimensions = analyzer.analyze

    assert attachment.verify
    assert_instance_of NullImageDimensions, image_dimensions
  end

  test "returns nil if the attachment has height equals nil" do
    attachment = Minitest::Mock.new
    attachment.expect :analyzed?, true
    attachment.expect :metadata, { height: nil }

    analyzer = ImageDimensionsAnalyzer.new(attachment)

    image_dimensions = analyzer.analyze

    assert attachment.verify
    assert_instance_of NullImageDimensions, image_dimensions
  end

  test "returns nil if the attachment has height equals 0" do
    attachment = Minitest::Mock.new
    attachment.expect :analyzed?, true
    attachment.expect :metadata, { height: 0 }

    analyzer = ImageDimensionsAnalyzer.new(attachment)

    image_dimensions = analyzer.analyze

    assert attachment.verify
    assert_instance_of NullImageDimensions, image_dimensions
  end

  test "returns square aspect ratio if the attachment fit the square constraints" do
    attachment = Minitest::Mock.new
    attachment.expect :analyzed?, true

    3.times do
      attachment.expect :metadata, { width: 400, height: 400 }
    end

    analyzer = ImageDimensionsAnalyzer.new(attachment)

    image_dimensions = analyzer.analyze

    assert attachment.verify
    assert image_dimensions.square?
  end

  test "returns portrait aspect ratio if the attachment fit the portrait constraints" do
    attachment = Minitest::Mock.new
    attachment.expect :analyzed?, true

    3.times do
      attachment.expect :metadata, { width: 400, height: 600 }
    end

    analyzer = ImageDimensionsAnalyzer.new(attachment)

    image_dimensions = analyzer.analyze

    assert attachment.verify
    assert image_dimensions.portrait?
  end

  test "returns landscape aspect ratio if the attachment fit the landscape constraints" do
    attachment = Minitest::Mock.new
    attachment.expect :analyzed?, true

    3.times do
      attachment.expect :metadata, { width: 1280, height: 728 }
    end

    analyzer = ImageDimensionsAnalyzer.new(attachment)

    image_dimensions = analyzer.analyze

    assert attachment.verify
    assert image_dimensions.landscape?
  end
end
