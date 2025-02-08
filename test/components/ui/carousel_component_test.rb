require "test_helper"

module UI
  module Carousel
    class ComponentTest < ViewComponent::TestCase
      test "renders the component" do
        render_inline(UI::Carousel::Component.new) do |carousel|
          carousel.with_viewport do |viewport|
            viewport.with_slide.with_content("Slide 1")
            viewport.with_slide.with_content("Slide 2")
            viewport.with_slide.with_content("Slide 3")
          end

          carousel.with_next_button
          carousel.with_previous_button
          carousel.with_indicator(slide: 1)
        end

        assert_text "Slide 1"
        assert_text "Slide 2"
        assert_text "Slide 3"
        assert_selector "button", count: 2
        assert_selector "[data-slide='1']"
      end
    end
  end
end
