module ApplicationHelper
  include Pagy::Frontend

  def spacer(amount = 16)
    render "rui/shared/email_spacer", amount: amount
  end

  def email_action(action, url, options = {})
    align = options[:align] ||= "left"
    theme = options[:theme] ||= "primary"
    fullwidth = options[:fullwidth] ||= false
    render "rui/shared/email_action", align: align, theme: theme, action: action, url: url, fullwidth: fullwidth
  end

  def email_callout(&block)
    render "rui/shared/email_callout", block: block
  end

  def number_with_precision(number, options = {})
    delegate_number_helper_method(:number_to_rounded, number, options)
  end

  def strip_zeros(number)
    number_with_precision(number, strip_insignificant_zeros: true)
  end

  def aspect_ratio_for(images)
    ratios = images.map { ImageDimensionsAnalyzer.new(it).analyze.aspect_ratio_type }
                   .tally
                   .max_by { |_, count| count }

    return :square if ratios.count > 1 && ratios.map { |_, count| count }.uniq.one?

    ratios.first
  end

  def aspect_ratio_css_classes_for(images)
    case aspect_ratio_for(images)
    when :square
      "aspect-[1/1]"
    when :portrait
      "aspect-[4/5]"
    when :landscape
      "aspect-[1.91/1]"
    else
      "aspect-[1/1]"
    end
  end
end
