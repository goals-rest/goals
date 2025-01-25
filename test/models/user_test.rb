require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    create(:user)
  end

  should define_enum_for(:profile_visibility)

  should have_many(:sessions)
  should have_many(:follows)
  should have_many(:followees).through(:follows)
  should have_many(:follows_as_followee)
  should have_many(:followers).through(:follows_as_followee)
  should have_many(:follow_requests)

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

  test "follows? returns true" do
    user1 = create(:user)
    user2 = create(:user)
    user1.follows.create(followee_id: user2.id)

    assert user1.follows?(user2)
  end

  test "follows? returns false" do
    user1 = create(:user)
    user2 = create(:user)

    assert_not user1.follows?(user2)
  end

  test "follows? returns false if user is nil" do
    user1 = create(:user)

    assert_not user1.follows?(nil)
  end

  test "returns follow for user" do
    user1 = create(:user)
    user2 = create(:user)
    follow = user1.follows.create(followee_id: user2.id)

    assert_equal follow, user1.follow_for(user2)
  end

  test "returns nil when follow for user does not exist" do
    user1 = create(:user)
    user2 = create(:user)

    assert_nil user1.follow_for(user2)
  end

  test "when current password is correct the password is updated" do
    user = create(:user, password: "123456")

    assert user.update(current_password: "123456", new_password: "12345678910")
  end

  test "when current password is not correct the password is not updated" do
    user = create(:user, password: "123456")

    assert_not user.update(current_password: "123", new_password: "12345678910")
  end

  test "validates the new password is present when current password is present" do
    user = create(:user, password: "123456")

    assert_not user.update(current_password: "123")
  end

  test "handle" do
    user = User.new(username: "test.test")

    assert_equal "@test.test", user.handle
  end
end
