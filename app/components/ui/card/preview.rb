module UI
  module Card
    class Preview < ViewComponent::Preview
      def playground
        render_with_template(template: "ui/card/previews/playground")
      end
    end
  end
end
