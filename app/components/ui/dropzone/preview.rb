module UI
  module Dropzone
    class Preview < ViewComponent::Preview
      def playground
        render(UI::Dropzone::Component.new) do |dropzone|
          dropzone.with_file_input
          dropzone.with_description.with_content("SVG, PNG, JPG or GIF (MAX. 800x400px)")
        end
      end
    end
  end
end
