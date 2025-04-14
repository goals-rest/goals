class ApplicationComponent < ViewComponent::Base
  include ViewComponentContrib::StyleVariants
  include Turbo::FramesHelper

  attr_reader :attrs

  TAILWIND_MERGER = TailwindMerge::Merger.new.freeze

  def initialize(**user_attrs)
    @attrs = AttributeMerger.merge(default_attrs, user_attrs)

    merge_tailwind_classes(attrs)
  end

  def call
    content&.html_safe
  end

  def default_attrs
    {}
  end

  private
  def merge_tailwind_classes(attributes)
    return unless attributes[:class].is_a?(String)

    attributes[:class] = TAILWIND_MERGER.merge(attributes[:class])
  end
end
