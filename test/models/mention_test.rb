require "test_helper"

class MentionTest < ActiveSupport::TestCase
  should belong_to(:entry).optional(true).inverse_of(:mentions)
  should belong_to(:mentioner).class_name("User")
  should belong_to(:mentionee).class_name("User")

  should validate_presence_of(:mentioner)
  should validate_presence_of(:mentionee)
end
