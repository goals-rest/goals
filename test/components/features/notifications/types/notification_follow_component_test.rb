require "test_helper"

module Notifications
  module Types
    class NotificationFollowComponentTest < ViewComponent::TestCase
      test "renders" do
        user = build_stubbed(:user)
        record = build_stubbed(:follow, follower: user)

        render_inline(Notifications::Types::NotificationFollowComponent.new(record:))

        assert_selector "img"
        assert_text(
          I18n.t("features.notifications.types.notification_follow_component.message", user_name: user.name)
        )
      end
    end
  end
end
