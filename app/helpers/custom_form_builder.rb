class CustomFormBuilder < ActionView::Helpers::FormBuilder
  private
  def errors_for?(method_name)
    return false if object.blank?

    errors = object.errors
    errors.keys.any?(method_name)
  end

  def add_classes(options, classes)
    options[:class] = [classes.flatten, options[:class]].compact.join(" ")
  end
end
