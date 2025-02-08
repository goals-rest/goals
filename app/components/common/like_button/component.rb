module LikeButton
  class Component < ApplicationComponent
    style :icon do
      variants {
        liked {
          yes { "text-primary-600 dark:text-primary-500" }
        }
      }
    end

    def initialize(liked: false, **user_attrs)
      @liked = liked

      super(**user_attrs)
    end

    def liked?
      @liked
    end

    def default_attrs
      {
        builder: :button,
        variant: :rounded,
        color: :transparent,
        size: :sm
      }
    end

    private
    def icon_attrs
      {
        variant: icon_variant,
        class: style(:icon, liked: liked?)
      }
    end

    def icon_variant
      return :solid if liked?

      :outline
    end
  end
end
