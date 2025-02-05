module ImagePreviewCard
  class HiddenInputComponent < ApplicationComponent
    def call
      tag.input(type: :hidden, **attrs)
    end
  end
end
