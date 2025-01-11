class ApplicationComponent < ViewComponent::Base
  include ViewComponentContrib::StyleVariants

  attr_reader :attrs

  def initialize(**user_attrs)
    @attrs = AttributeMerger.new(default_attrs, user_attrs).merge

    merge_tailwind_classes(attrs)
  end

  def default_attrs
    {}
  end

  private
  def merge_tailwind_classes(attributes)
    return unless attributes[:class].is_a?(String)

    attributes[:class] = TailwindMerge::Merger.new.merge(attributes[:class])
  end
end
