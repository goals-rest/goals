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
end
