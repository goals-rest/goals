require "test_helper"

class Entry::LikeTest < ActiveSupport::TestCase
  should belong_to(:entry)
  should belong_to(:user)

  should have_many(:notification_likes).dependent(:destroy)

  test "validates user uniqueness" do
    entry = create(:entry, :post)
    user = create(:user)

    create(:entry_like, entry:, user:)

    like = build(:entry_like, entry:, user:)

    assert_not like.valid?
    assert_includes like.errors[:user], I18n.t("errors.messages.taken")
  end

  test "after save touches the entryable" do
    entry = create(:entry, :post)
    user = create(:user)

    like = create(:entry_like, entry:, user:)

    assert_changes -> { entry.entryable.updated_at } do
      like.save!
    end
  end

  test "after destroy touches the entryable" do
    entry = create(:entry, :post)
    user = create(:user)

    like = create(:entry_like, entry:, user:)

    assert_changes -> { entry.entryable.updated_at } do
      like.destroy
    end
  end
end
