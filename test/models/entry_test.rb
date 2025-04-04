require "test_helper"

class EntryTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  should belong_to(:owner)

  should have_many(:likes).dependent(:destroy)
  should have_many(:notification_comments).dependent(:destroy)
  should have_many(:comments).dependent(:destroy)

  test "builds with post" do
    post, entry = Entry.build_with_post(Post.new, owner: User.new)

    assert_instance_of Post, post
    assert_instance_of Entry, entry
  end

  test "posts_owned_by scope returns entries owned by the given user" do
    user1 = create(:user)
    user2 = create(:user)

    post1 = create(:entry, :post, owner: user1)
    post2 = create(:entry, :post, owner: user2)

    assert_equal [ post1 ], Entry.posts_owned_by(user1)
  end

  test "feed scope returns the owner and their followee posts" do
    user1 = create(:user)
    user2 = create(:user)
    user3 = create(:user)

    post1 = create(:entry, :post, owner: user1)
    post2 = create(:entry, :post, owner: user2)
    _post3 = create(:entry, :post, owner: user3)

    # user 1 follows user 2
    create(:follow, follower: user1, followee: user2)

    assert_equal [ post1, post2 ], Entry.feed(owner: user1)
  end

  test "visible scope returns entries owned by the current user and their followees" do
    current_user = create(:user)
    followee = create(:user)
    create(:follow, follower: current_user, followee:)
    entry1 = create(:entry, :post, owner: current_user)
    entry2 = create(:entry, :post, owner: followee)

    assert_equal [ entry1, entry2 ], Entry.visible(current_user)
  end

  test "feed scope returns entries with type Post" do
    user = create(:user)
    post = create(:entry, :post, owner: user)

    create(:entry, entryable_type: User, entryable_id: 1, owner: user)

    assert_equal [ post ], Entry.feed(owner: user)
  end

  test "feed scope returns followee entries with type Post" do
    current_user = create(:user)
    followee = create(:user)
    create(:follow, follower: current_user, followee:)
    post = create(:entry, :post, owner: followee)

    create(:entry, entryable_type: User, entryable_id: 1, owner: followee)

    assert_equal [ post ], Entry.feed(owner: current_user)
  end

  test "liked? returns true if entry is already liked by given user" do
    user = create(:user)
    entry = create(:entry, :post, owner: user)
    create(:entry_like, entry:, user:)

    assert entry.liked?(user:)
  end

  test "liked? returns false if entry is not liked by given user" do
    user = create(:user)
    entry = create(:entry, :post, owner: user)
    create(:entry_like, entry:, user: create(:user))

    assert_not entry.liked?(user:)
  end

  test "like_for returns the user's like if user is provided" do
    user = create(:user)
    entry = create(:entry, :post)
    like = create(:entry_like, entry:, user:)

    assert_equal like, entry.like_for(user)
  end

  test "like_for returns nil if user is not provided" do
    user = create(:user)
    entry = create(:entry, :post)
    create(:entry_like, entry:, user:)

    assert_nil entry.like_for(nil)
  end

  test "sync_mentions_later enqueues a Entry::MentionSyncerJob" do
    entry = create(:entry, :post)

    assert_enqueued_with(job: Entry::MentionSyncerJob, args: [ entry ]) do
      entry.sync_mentions_later
    end
  end

  test "mentioned_handles returns the usernames of the mentioned users" do
    user1 = create(:user, username: "user1")
    user2 = create(:user, username: "user2")

    post = create(:post, body: "Hello @user1, @user2.")
    entry = create(:entry, entryable: post)

    create(:mention, entry:, mentionee: user1, mentioner: user1)
    create(:mention, entry:, mentionee: user2, mentioner: user1)

    assert_equal [ Handle.new("@user1"), Handle.new("@user2") ], entry.mentioned_handles
  end

  test "render_content returns the rendered content" do
    post = create(:post, body: "Hello, world!")
    entry = create(:entry, entryable: post)

    assert_equal "Hello, world!", entry.render_content
  end
end
