class NullImageDimensions
  def aspect_ratio
    0
  end

  def landscape?
    false
  end

  def portrait?
    false
  end

  def square?
    false
  end

  def aspect_ratio_type
    :none
  end
end
