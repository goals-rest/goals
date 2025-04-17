require "test_helper"

module Chats
  module InboxPanel
    class ComponentTest < ViewComponent::TestCase
      test "renders" do
        render_inline(Chats::InboxPanel::Component.new) do |inbox|
          inbox.with_search_section
          inbox.with_chat_list do |list|
            list.with_item(active: true, new: true)
            list.with_item
          end
        end

        assert_selector "form"
        assert_selector "input[type='text']"
      end
    end
  end
end
