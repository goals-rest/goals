require "test_helper"

class Entry::MentionSyncerTest < ActiveSupport::TestCase
  test "creates new mentions" do
    user1 = create(:user, username: "user1")
    user2 = create(:user, username: "user2")
    user3 = create(:user, username: "user3")

    create(:follow, follower: user2, followee: user1)
    create(:follow, follower: user3, followee: user1)

    post = create(:post, body: "Hello @user2, @user3.")
    entry = create(:entry, entryable: post, owner: user1)

    assert_difference "Mention.count", 2 do
      Entry::MentionSyncer.new(entry).sync
    end

    assert_equal [ user2, user3 ], entry.mentions.map(&:mentionee)
  end

  test "destroys removed mentions" do
    user1 = create(:user, username: "user1")
    user2 = create(:user, username: "user2")
    user3 = create(:user, username: "user3")

    create(:follow, follower: user2, followee: user1)
    create(:follow, follower: user3, followee: user1)

    post = create(:post, body: "Hello @user2, @user3.")
    entry = create(:entry, entryable: post, owner: user1)

    Entry::MentionSyncer.new(entry).sync

    post.update!(body: "Hello @user2.")

    assert_difference "Mention.count", -1 do
      Entry::MentionSyncer.new(entry.reload).sync
    end

    assert_equal [ user2 ], entry.mentions.map(&:mentionee)
  end

  test "does not create new mentions if the user is already mentioned" do
    user1 = create(:user, username: "user1")
    user2 = create(:user, username: "user2")

    create(:follow, follower: user2, followee: user1)

    post = create(:post, body: "Hello @user2.")
    entry = create(:entry, entryable: post, owner: user1)

    create(:mention, entry:, mentioner: user1, mentionee: user2)

    assert_no_difference "Mention.count" do
      Entry::MentionSyncer.new(entry).sync
    end
  end

  test "does not create duplicated mentions" do
    user1 = create(:user, username: "user1")
    user2 = create(:user, username: "user2")

    create(:follow, follower: user2, followee: user1)

    post = create(:post, body: "Hello @user2, @user2.")
    entry = create(:entry, entryable: post, owner: user1)

    assert_difference "Mention.count", 1 do
      Entry::MentionSyncer.new(entry).sync
    end
  end

  test "does not destroy unrelated mentions" do
    user1 = create(:user, username: "user1")
    user2 = create(:user, username: "user2")
    user3 = create(:user, username: "user3")

    create(:follow, follower: user2, followee: user1)

    post = create(:post, body: "Hello @user2.")
    entry = create(:entry, entryable: post, owner: user1)

    create(:mention, entry:, mentioner: user1, mentionee: user3)

    assert_no_difference "Mention.count" do
      Entry::MentionSyncer.new(entry).sync
    end
  end

  test "does not destroy mentions of other users" do
    user1 = create(:user, username: "user1")
    user2 = create(:user, username: "user2")
    user3 = create(:user, username: "user3")

    create(:follow, follower: user2, followee: user1)

    post = create(:post, body: "Hello @user2.")
    entry = create(:entry, entryable: post, owner: user1)

    create(:mention, entry:, mentioner: user2, mentionee: user1)

    assert_no_difference "Mention.count" do
      Entry::MentionSyncer.new(entry).sync
    end
  end

  test "does not create mentions for non existent users" do
    user1 = create(:user, username: "user1")

    post = create(:post, body: "Hello @user2.")
    entry = create(:entry, entryable: post, owner: user1)

    assert_no_difference "Mention.count" do
      Entry::MentionSyncer.new(entry).sync
    end
  end

  test "can only mention followers" do
    user1 = create(:user, username: "user1")
    user2 = create(:user, username: "user2")
    user3 = create(:user, username: "user3")

    create(:follow, follower: user2, followee: user1)

    post = create(:post, body: "Hello @user2, @user3.")
    entry = create(:entry, entryable: post, owner: user1)

    assert_difference "Mention.count", 1 do
      Entry::MentionSyncer.new(entry).sync
    end

    assert_equal [ user2 ], entry.mentions.map(&:mentionee)
  end
end
