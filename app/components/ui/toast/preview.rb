module UI
  module Toast
    class Preview < ViewComponent::Preview
      # @param placement select { choices: [ top_right, bottom_right, bottom_left, top_left ] }
      def playground(placement: :top_right)
        render UI::Toast::Component.new(placement:) do |toast|
          toast.with_title.with_content("Toast Title")
          toast.with_description.with_content("Toast description.")
          toast.with_icon("check-circle", class: "size-6 text-green-500 dark:text-green:400")
            .with_content("Toast description.")
        end
      end
    end
  end
end
