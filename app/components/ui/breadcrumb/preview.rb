module UI
  module Breadcrumb
    class Preview < ViewComponent::Preview
      def playground
        render_with_template(template: "ui/breadcrumb/previews/playground")
      end
    end
  end
end
