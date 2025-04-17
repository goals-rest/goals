module Chats
  module InboxPanel
    class Preview < ViewComponent::Preview
      def playground
        render(Chats::InboxPanel::Component.new) do |inbox|
          inbox.with_search_section
          inbox.with_chat_list do |list|
            list.with_item(active: true, new: true)
            list.with_item
            list.with_item
            list.with_item
            list.with_item
            list.with_item
            list.with_item
          end
        end
      end
    end
  end
end
