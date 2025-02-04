module UI
  module Skeleton
    class Preview < ViewComponent::Preview
      def playground
        render(UI::Skeleton::Component.new(class: "w-48 h-4"))
      end

      def infer_size
        render(UI::Skeleton::Component.new.with_content("Skeleton"))
      end

      def card
        render_with_template(template: "ui/skeleton/previews/card")
      end
    end
  end
end
