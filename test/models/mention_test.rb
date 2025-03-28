require "test_helper"

class MentionTest < ActiveSupport::TestCase
  should belong_to(:entry).optional(true).inverse_of(:mentions)
  should belong_to(:mentioner).class_name("User")
  should belong_to(:mentionee).class_name("User")

  test "url returns the profile path for the mentionee" do
    mentionee = User.new(username: "john.doe")
    mention = Mention.new(mentionee: mentionee)

    assert_equal "/john.doe", mention.url
  end
end
