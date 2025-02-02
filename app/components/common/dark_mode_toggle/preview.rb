module DarkModeToggle
  class Preview < ViewComponent::Preview
    def playground
      render DarkModeToggle::Component.new do |toggle|
        toggle.with_light_mode_icon("sun")
        toggle.with_dark_mode_icon("moon")
      end
    end
  end
end
