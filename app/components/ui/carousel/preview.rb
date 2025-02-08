module UI
  module Carousel
    class Preview < ViewComponent::Preview
      def playground
        render_with_template(template: "ui/carousel/previews/playground")
      end
    end
  end
end
