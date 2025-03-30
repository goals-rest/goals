require "test_helper"

module Mentions
  module Mention
    class ComponentTest < ViewComponent::TestCase
      test "renders the component" do
        mentionee = User.new(username: "john.doe")
        mention = ::Mention.new(mentionee: mentionee)

        render_inline(Mentions::Mention::Component.new(mention:))

        assert_selector "a[href='/john.doe']", text: "@john.doe"
      end
    end
  end
end
