require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    create(:user)
  end

  should have_many(:sessions)

  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)

  should validate_length_of(:first_name).is_at_most(255)
  should validate_length_of(:last_name).is_at_most(255)

  should validate_uniqueness_of(:email_address).case_insensitive
  should validate_uniqueness_of(:username).case_insensitive

  test "name" do
    user = User.new(first_name: "John", last_name: "Doe")
    assert_equal "John Doe", user.name
  end

  test "generates an username when creating a new user" do
    user = create(:user, first_name: "John", last_name: "Doe")
    assert_equal "john.doe", user.username
  end

  test "generates an username with random hex when there is a collision" do
    create(:user, first_name: "John", last_name: "Doe")
    user = create(:user, first_name: "John", last_name: "Doe")
    assert_match /john.doe.[a-z0-9]+{6}/, user.username
  end

  test "when first_name and last_name are 255 characters, the username gets truncated to 255 characters long" do
    user = create(:user, first_name: "a" * 255, last_name: "a" * 255)
    assert_equal 255, user.username.size
  end

  test "when first_name and last_name are 255 characters and there is a collision, the username gets truncated to 255 characters long" do
    create(:user, first_name: "a" * 255, last_name: "a" * 255)
    user = create(:user, first_name: "a" * 255, last_name: "a" * 255)
    assert_match /a{248}\.[a-z0-9]+{6}/, user.username
  end
end
