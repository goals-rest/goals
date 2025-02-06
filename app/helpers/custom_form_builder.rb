class CustomFormBuilder < ActionView::Helpers::FormBuilder
  [
   :text_field,
   :email_field,
   :password_field,
   :telephone_field,
   :url_field,
   :number_field,
   :date_field,
   :datetime_local_field,
   :month_field,
   :week_field,
   :time_field,
   :color_field,
   :search_field
  ].each do |method|
    define_method(method) do |method_name, options = {}|
      field_classes = [ "form-input", ("form-input-error" if errors_for?(method_name)) ]

      add_classes(options, field_classes)

      super(method_name, options)
    end
  end

  def label(method, text = nil, options = {}, &block)
    add_classes(options, [ "form-label" ])

    super(method, text, options, &block)
  end

  def checkbox(method, options = {}, checked_value = "1", unchecked_value = "0")
    add_classes(options, [ "form-input-checkbox" ])

    super(method, options, checked_value, unchecked_value)
  end

  def radio_button(method, tag_value, options = {})
    add_classes(options, [ "form-input-radio" ])

    super(method, tag_value, options)
  end

  def textarea(method, options = {})
    add_classes(options, [ "form-textarea", ("form-input-error" if errors_for?(method)) ])

    super(method, options)
  end

  def select(method, choices = nil, options = {}, html_options = {}, &block)
    field_classes = [ "form-select" ]

    add_classes(html_options, field_classes)

    super(method, choices, options, html_options, &block)
  end

  def file_field(method, options = {})
    field_classes = [ "form-file" ]

    add_classes(options, field_classes)

    super(method, options)
  end

  def form_group(method, options = {}, &block)
    add_classes(options, [ "form-group" ])

    @template.tag.div(**options, &block)
  end

  def error_message(method, options = {})
    return unless errors_for?(method)

    add_classes(options, [ "mt-1 text-sm text-red-700 dark:text-red-400" ])

    @template.tag.div(error_for(method), **options)
  end

  def submit(content = nil, **options, &block)
    add_classes(options, [ "btn btn-primary cursor-pointer" ])

    super(content = nil, **options, &block)
  end

  private
  def errors_for?(method_name)
    return false unless object.respond_to?(:errors)

    object.errors.key?(method_name)
  end

  def error_for(method_name)
    return nil unless errors_for?(method_name)

    object.errors[method_name].first.capitalize
  end

  def add_classes(options, classes)
    options[:class] = [ classes.flatten, options[:class] ].compact.join(" ")

    merge_tailwind_classes(options)
  end

  def merge_tailwind_classes(attributes)
    return unless attributes[:class].is_a?(String)

    attributes[:class] = TailwindMerge::Merger.new.merge(attributes[:class])
  end
end
