require "test_helper"

class Entry::MentionCleanerTest < ActiveSupport::TestCase
  test "destroys removed mentions" do
    user1 = create(:user, username: "user1")
    user2 = create(:user, username: "user2")
    user3 = create(:user, username: "user3")

    create(:follow, follower: user2, followee: user1)
    create(:follow, follower: user3, followee: user1)

    post = create(:post, body: "Hello @user2, @user3.")
    entry = create(:entry, entryable: post, owner: user1)

    create(:mention, entry:, mentioner: user1, mentionee: user2)
    create(:mention, entry:, mentioner: user1, mentionee: user3)

    post.update!(body: "Hello @user2.")

    assert_difference "Mention.count", -1 do
      Entry::MentionCleaner.new(entry).clean
    end

    assert_equal [ user2 ], entry.mentions.map(&:mentionee)
  end

  test "does not destroy mentions of other users" do
    user1 = create(:user, username: "user1")
    user2 = create(:user, username: "user2")
    user3 = create(:user, username: "user3")

    post1 = create(:post, body: "Hello @user2.")
    entry1 = create(:entry, entryable: post1, owner: user1)

    create(:mention, entry: entry1, mentioner: user1, mentionee: user2)

    post2 = create(:post, body: "Hello.")
    entry2 = create(:entry, entryable: post2, owner: user2)

    create(:mention, entry: entry2, mentioner: user2, mentionee: user3)

    assert_difference "Mention.count", -1 do
      Entry::MentionCleaner.new(entry2).clean
    end

    assert_equal [ user2 ], entry1.mentions.reload.map(&:mentionee)
    assert entry2.reload.mentions.none?
  end
end
