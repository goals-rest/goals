module UI
  module Counter
    class Preview < ViewComponent::Preview
      # @param value number
      def playground(value: 0)
        render_with_template(template: "ui/counter/previews/playground", locals: { value: })
      end
    end
  end
end
