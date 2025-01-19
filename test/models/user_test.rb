require "test_helper"

class UserTest < ActiveSupport::TestCase
  should have_many(:sessions)

  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)

  should validate_length_of(:first_name).is_at_most(255)
  should validate_length_of(:last_name).is_at_most(255)

  should validate_uniqueness_of(:email_address).case_insensitive

  test "name" do
    user = User.new(first_name: "John", last_name: "Doe")
    assert "John Doe", user.name
  end
end
