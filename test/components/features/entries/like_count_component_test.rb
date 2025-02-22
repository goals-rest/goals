require "test_helper"

module Entries
  module LikeCount
    class ComponentTest < ViewComponent::TestCase
      test "renders" do
        entry = build_stubbed(:entry)

        render_inline(Entries::LikeCount::Component.new(entry: entry))

        assert_text "0 kudos"
      end

      test "renders with likes" do
        user = create(:user)
        entry = create(:entry, :post)
        create(:entry_like, entry:, user:)

        render_inline(Entries::LikeCount::Component.new(entry: entry))

        assert_text "1 kudos"
      end
    end
  end
end
