module LikeButton
  class Preview < ViewComponent::Preview
    # @param liked toggle
    def playground(liked: true)
      render LikeButton::Component.new(liked:)
    end
  end
end
