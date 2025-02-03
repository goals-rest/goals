require "test_helper"

class EntryTest < ActiveSupport::TestCase
  should belong_to(:owner)

  test "builds with post" do
    post, entry = Entry.build_with_post(Post.new, owner: User.new)

    assert_instance_of Post, post
    assert_instance_of Entry, entry
  end

  test "feed scope returns the owner and their followee posts" do
    user1 = create(:user)
    user2 = create(:user)
    user3 = create(:user)

    post1 = create(:entry, :post, owner: user1)
    post2 = create(:entry, :post, owner: user2)
    post3 = create(:entry, :post, owner: user3)

    # user 1 follows user 2
    create(:follow, follower: user1, followee: user2)

    assert_equal [ post1, post2 ], Entry.feed(owner: user1)
  end

  test "feed scope returns entries with type Post" do
    user = create(:user)
    post = create(:entry, :post, owner: user)

    create(:entry, entryable_type: User, entryable_id: 1, owner: user)

    assert_equal [ post ], Entry.feed(owner: user)
  end
end
