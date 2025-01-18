module UI
  module Modal
    class Preview < ViewComponent::Preview
      # @param open toggle "When true the modal opens automatically"
      # @param static toggle "Controls if the modal can be closed by clicking ouside"
      def playground(open: false, static: false)
        render_with_template(template: "ui/modal/previews/playground")
      end

      def static
        render_with_template(template: "ui/modal/previews/static")
      end

      def open
        render_with_template(template: "ui/modal/previews/open")
      end
    end
  end
end
