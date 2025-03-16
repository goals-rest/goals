require "test_helper"

module Notifications
  class ItemComponentTest < ViewComponent::TestCase
    test "renders" do
      user = build_stubbed(:user)
      record = build_stubbed(:entry_like, user:)

      notifiable = build_stubbed(:notification_like, entry_like: record)
      notification = build_stubbed(:notification, notifiable:)
      user_notification = build_stubbed(:user_notification, user:, notification:)

      item_component = render_inline(Notifications::ItemComponent.new(user_notification:))
      notification_type_component = render_inline(Notifications::Types::NotificationLikeComponent.new(record:))

      assert_includes item_component.to_html, notification_type_component.to_html
    end
  end
end
