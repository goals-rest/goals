module ImagePreviewCard
  class FileInputComponent < ApplicationComponent
    def call
      tag.input(type: :file, class: "hidden", **attrs)
    end
  end
end
