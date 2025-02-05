module ImagePreviewCard
  class Component < ApplicationComponent
    renders_one :image, ImagePreviewCard::ImageComponent
    renders_one :file_input, ImagePreviewCard::FileInputComponent
    renders_one :hidden_input, ImagePreviewCard::HiddenInputComponent

    private
    def default_attrs
      {
        data: {
          controller: "removal"
        }
      }
    end
  end
end
