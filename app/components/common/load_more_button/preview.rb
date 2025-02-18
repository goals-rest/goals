module LoadMoreButton
  class Preview < ViewComponent::Preview
    # @param href text
    # @param content text
    def playground(href: "#", content: "Ver mais kudos")
      render(LoadMoreButton::Component.new(href:)) { content }
    end
  end
end
