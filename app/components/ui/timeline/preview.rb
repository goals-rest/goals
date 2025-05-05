module UI
  module Timeline
    class Preview < ViewComponent::Preview
      def playground
        render UI::Timeline::Component.new do |timeline|
          3.times do
            timeline.with_item do |item|
              item.with_badge(class: "bg-primary-100 dark:bg-primary-900") do |badge|
                badge.with_icon("check-circle", class: "size-4 text-primary-800 dark:text-primary-300")
              end
              item.with_body.with_content("Timeline Item")
            end
          end
        end
      end
    end
  end
end
