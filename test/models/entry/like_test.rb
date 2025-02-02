require "test_helper"

class Entry::LikeTest < ActiveSupport::TestCase
  should belong_to(:entry)
  should belong_to(:user)

  should "validates user uniqueness" do
    entry = create(:entry)
    user = create(:user)

    create(:entry_like, entry:, user:)

    like = build(:entry_like, entry:, user:)

    assert_not like.valid?
    assert_includes like.errors[:user], I18n.t("errors.messages.taken")
  end
end
