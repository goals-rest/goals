require "test_helper"

class CommentTest < ActiveSupport::TestCase
  should belong_to(:parent)
  should have_one(:owner).through(:entry)

  should validate_presence_of(:body)
  should validate_length_of(:body).is_at_most(2200)

  test "mentioned_handles" do
    entry = create(:entry, :post)
    comment = create(:comment, parent: entry, body: "Hello @user, @user2.")

    assert_equal [ Handle.new("@user"), Handle.new("@user2") ], comment.mentioned_handles
  end
end
