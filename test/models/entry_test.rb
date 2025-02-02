require "test_helper"

class EntryTest < ActiveSupport::TestCase
  should belong_to(:owner)

  test "builds with post" do
    post, entry = Entry.build_with_post(Post.new, owner: User.new)

    assert_instance_of Post, post
    assert_instance_of Entry, entry
  end
end
