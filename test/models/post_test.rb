require "test_helper"

class PostTest < ActiveSupport::TestCase
  should validate_presence_of(:title)
  should validate_presence_of(:body)

  should validate_length_of(:title).is_at_most(60)

  should validate_content_type_of(:images).allowing("image/png", "image/gif", "image/jpeg", "image/gif")
  should validate_size_of(:images).less_than_or_equal_to(8.megabytes)
  should validate_limits_of(:images).max(5)

  test "destroys entry when post is destroyed" do
    entry = create(:entry, :post)

    assert_difference "Entry.count", -1 do
      entry.post.destroy
    end
  end
end
