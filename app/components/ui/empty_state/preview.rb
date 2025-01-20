module UI
  module EmptyState
    class Preview < ViewComponent::Preview
      def playground
        render UI::EmptyState::Component.new do |empty_state|
          empty_state.with_icon("document", class: "size-8 font-semibold font-heading text-zinc-900 dark:text-zinc-100")
          empty_state.with_title.with_content("No goals")
          empty_state.with_description.with_content("No goals found")
          empty_state.with_actions do
            empty_state.render UI::Button::Component.new do |button|
              button.with_leading_icon("plus-circle")

              "Create goal"
            end
          end
        end
      end
    end
  end
end
