require "test_helper"

class CommentTest < ActiveSupport::TestCase
  should belong_to(:parent)
  should have_one(:owner).through(:entry)

  should validate_presence_of(:body)
  should validate_length_of(:body).is_at_most(2200)
end
