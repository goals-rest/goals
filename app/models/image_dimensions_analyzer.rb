class ImageDimensionsAnalyzer
  def initialize(image)
    @image = image
  end

  def analyze
    return NullImageDimensions.new unless analyzable?

    ImageDimensions.new(image_width, image_height)
  end

  private
  def analyzable?
    metadata_available? && valid_image_dimensions?
  end

  def metadata_available?
    @image.respond_to?(:analyzed?) && @image.analyzed?
  end

  def valid_image_dimensions?
    @image.metadata
         .values_at(:width, :height)
         .all? { valid_size?(it) }
  end

  def valid_size?(size)
    size.present? && size.positive?
  end

  def image_width
    @image.metadata[:width]
  end

  def image_height
    @image.metadata[:height]
  end
end
