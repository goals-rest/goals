module Mentions
  module Mention
    class Preview < ViewComponent::Preview
      def playground
        mentionee = User.new(username: "john.doe")
        mention = ::Mention.new(mentionee: mentionee)

        render(Mentions::Mention::Component.new(mention:))
      end
    end
  end
end
