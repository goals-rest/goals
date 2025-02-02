require "test_helper"

class PostTest < ActiveSupport::TestCase
  context "validations" do
    should validate_presence_of(:title)
    should validate_presence_of(:body)

    should validate_length_of(:title).is_at_most(60)
  end
end
