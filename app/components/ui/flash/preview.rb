module UI
  module Flash
    class Preview < ViewComponent::Preview
      # @param type select { choices: [ notice, alert ] }
      # @param auto_hide toggle "Hides the alert after a short duration"
      def playground(type: :notice, auto_hide: false)
        render UI::Flash::Component.new(type:, auto_hide:).with_content("Alert message")
      end
    end
  end
end
