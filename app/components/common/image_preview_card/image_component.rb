module ImagePreviewCard
  class ImageComponent < ApplicationComponent
    def call
      render UI::Card::MediaComponent.new(src: "", **attrs)
    end

    private
    def default_attrs
      {
        class: "object-contain"
      }
    end
  end
end
