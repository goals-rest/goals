require "test_helper"

module Notifications
  module Types
    class NotificationLikeComponentTest < ViewComponent::TestCase
      test "renders" do
        user = build_stubbed(:user)
        record = build_stubbed(:entry_like, user:)

        render_inline(Notifications::Types::NotificationLikeComponent.new(record:))

        assert_selector "img"
        assert_text user.name
        assert_text(
          I18n.t("features.notifications.types.notification_like_component.entry_post")
        )
      end
    end
  end
end
