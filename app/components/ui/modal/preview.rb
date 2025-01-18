module UI
  module Modal
    class Preview < ViewComponent::Preview
      def playground
        render UI::Modal::Component.new do |modal|
          modal.with_trigger do
            modal.render UI::Button::Component.new.with_content("Open Modal")
          end

          "The modal content goes here"
        end
      end
    end
  end
end
