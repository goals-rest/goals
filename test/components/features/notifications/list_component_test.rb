require "test_helper"

module Notifications
  class ListComponentTest < ViewComponent::TestCase
    test "renders without notifications" do
      render_inline(Notifications::ListComponent.new(user_notifications: UserNotification.none))

      assert_text I18n.t("features.notifications.list_component.empty_state_message")
      assert_no_text I18n.t("features.notifications.list_component.see_all")
    end

    test "renders with read notifications" do
      user = create(:user)
      user_notification = create(:user_notification, :read, user:)

      render_inline(Notifications::ListComponent.new(
          user_notifications: user.user_notifications,
          href: "https://example.com"
        )
      )

      assert_no_selector "span.bg-red-500"
      assert_link href: "https://example.com"
      assert_text I18n.t("features.notifications.list_component.see_all")
      assert_no_text I18n.t("features.notifications.list_component.empty_state_message")
    end

    test "renders with unread notifications" do
      user = create(:user)
      user_notification = create(:user_notification, user:)

      render_inline(Notifications::ListComponent.new(
          user_notifications: user.user_notifications,
          href: "https://example.com"
        )
      )

      assert_selector "span.bg-red-500"
    end
  end
end
