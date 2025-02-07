module LikeButton
  class Component < ApplicationComponent
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
  end
end
