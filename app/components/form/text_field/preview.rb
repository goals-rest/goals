module Form
  module TextField
    class Preview < ViewComponent::Preview
      # @param invalid toggle
      def playground(invalid: false)
        render Form::TextField::Component.new(invalid:)
      end
    end
  end
end
