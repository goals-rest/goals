require "test_helper"

module Notifications
  module Types
    class NotificationCommentComponentTest < ViewComponent::TestCase
      include Rails.application.routes.url_helpers
      test "renders" do
        user = create(:user)
        entry = create(:entry, :post)
        record = create(:comment, parent: entry, owner: user)

        render_inline(Notifications::Types::NotificationCommentComponent.new(record:))

        assert_selector "img"
        assert_text user.name
        assert_text(
          I18n.t("features.notifications.types.notification_comment_component.message", user_name: user.name)
        )
        assert_link entry.post.title, href: post_path(entry.post)
      end
    end
  end
end
