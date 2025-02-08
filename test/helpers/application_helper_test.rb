require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  test "#number_with_precision" do
    assert_equal "10,26", number_with_precision(10.256, precision: 2)
  end

  test "#strip_zeros" do
    assert_equal "10", strip_zeros(10.00)
    assert_equal "10,5", strip_zeros(10.5)
  end

  test "#aspect_ratio_for returns a square aspect ratio if most images have square aspect ratio" do
    post = create(
      :post,
      images: [
        file_fixture_upload("400x400.png", "image/png"),
        file_fixture_upload("400x400.png", "image/png"),
        file_fixture_upload("640x480.png", "image/png"),
        file_fixture_upload("400x800.png", "image/png")
      ]
    )

    post.images.each { it.analyze }

    assert_equal :square, aspect_ratio_for(post.images)
  end

  test "#aspect_ratio_for returns a portrait aspect ratio if most images have portrait aspect ratio" do
    post = create(
      :post,
      images: [
        file_fixture_upload("400x400.png", "image/png"),
        file_fixture_upload("640x480.png", "image/png"),
        file_fixture_upload("400x800.png", "image/png"),
        file_fixture_upload("400x800.png", "image/png")
      ]
    )

    post.images.each { it.analyze }

    assert_equal :portrait, aspect_ratio_for(post.images)
  end

  test "#aspect_ratio_for returns a landscape aspect ratio if most images have portrait aspect ratio" do
    post = create(
      :post,
      images: [
        file_fixture_upload("400x400.png", "image/png"),
        file_fixture_upload("640x480.png", "image/png"),
        file_fixture_upload("640x480.png", "image/png"),
        file_fixture_upload("400x800.png", "image/png")
      ]
    )

    post.images.each { it.analyze }

    assert_equal :landscape, aspect_ratio_for(post.images)
  end

  test "#aspect_ratio_for returns a square aspect ratio if there is no single most common aspect ratio" do
    post = create(
      :post,
      images: [
        file_fixture_upload("400x400.png", "image/png"),
        file_fixture_upload("640x480.png", "image/png"),
        file_fixture_upload("400x800.png", "image/png")
      ]
    )

    post.images.each { it.analyze }

    assert_equal :square, aspect_ratio_for(post.images)
  end

  test "#aspect_ratio_for returns a none aspect ratio if the images were not analyzed yet" do
    post = create(
      :post,
      images: [
        file_fixture_upload("400x400.png", "image/png"),
        file_fixture_upload("640x480.png", "image/png"),
        file_fixture_upload("400x800.png", "image/png")
      ]
    )

    assert_equal :none, aspect_ratio_for(post.images)
  end

  test "#aspect_ratio_css_classes_for returns the classes for the square aspect ratio" do
    post = create(
      :post,
      images: [
        file_fixture_upload("400x400.png", "image/png"),
        file_fixture_upload("400x400.png", "image/png"),
        file_fixture_upload("640x480.png", "image/png"),
        file_fixture_upload("400x800.png", "image/png")
      ]
    )

    post.images.each { it.analyze }

    assert_equal "aspect-[1/1]", aspect_ratio_css_classes_for(post.images)
  end

  test "#aspect_ratio_css_classes_for returns the classes for the portrait aspect ratio" do
    post = create(
      :post,
      images: [
        file_fixture_upload("400x400.png", "image/png"),
        file_fixture_upload("400x800.png", "image/png"),
        file_fixture_upload("400x800.png", "image/png"),
        file_fixture_upload("640x480.png", "image/png")
      ]
    )

    post.images.each { it.analyze }

    assert_equal "aspect-[4/5]", aspect_ratio_css_classes_for(post.images)
  end

  test "#aspect_ratio_css_classes_for returns the classes for the landscape aspect ratio" do
    post = create(
      :post,
      images: [
        file_fixture_upload("400x400.png", "image/png"),
        file_fixture_upload("400x800.png", "image/png"),
        file_fixture_upload("640x480.png", "image/png"),
        file_fixture_upload("640x480.png", "image/png")
      ]
    )

    post.images.each { it.analyze }

    assert_equal "aspect-[1.91/1]", aspect_ratio_css_classes_for(post.images)
  end

  test "#aspect_ratio_css_classes_for returns default aspect ratio classes if the images have not been analyzed yet" do
    post = create(
      :post,
      images: [
        file_fixture_upload("400x400.png", "image/png"),
        file_fixture_upload("400x800.png", "image/png"),
        file_fixture_upload("640x480.png", "image/png"),
        file_fixture_upload("640x480.png", "image/png")
      ]
    )

    assert_equal "aspect-[1/1]", aspect_ratio_css_classes_for(post.images)
  end
end
