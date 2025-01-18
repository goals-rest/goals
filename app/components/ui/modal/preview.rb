module UI
  module Modal
    class Preview < ViewComponent::Preview
      def playground
        render UI::Modal::Component.new do |modal|
        end
      end
    end
  end
end
