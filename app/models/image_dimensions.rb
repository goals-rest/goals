class ImageDimensions
  def initialize(width, height)
    raise "Invalid width value: #{width}" if width.blank? || width.zero?
    raise "Invalid height value: #{height}" if height.blank? || height.zero?

    @width = width.to_f
    @height = height.to_f
  end

  def aspect_ratio
    @width / @height
  end

  def landscape?
    aspect_ratio >= 1.25
  end

  def portrait?
    aspect_ratio <= 0.8
  end

  def square?
    aspect_ratio > 0.8 && aspect_ratio < 1.25
  end

  def aspect_ratio_type
    if landscape?
      :landscape
    elsif portrait?
      :portrait
    else
      :square
    end
  end
end
