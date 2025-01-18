module UI
  module Modal
    class Preview < ViewComponent::Preview
      def playground
        render_with_template(template: "ui/modal/previews/playground")
      end
    end
  end
end
