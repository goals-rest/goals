require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    create(:user)
  end

  should define_enum_for(:profile_visibility)

  should have_many(:sessions)
  should have_many(:goals)
  should have_many(:entries)
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

  test "allowed to view profile if user is themselves" do
    user = User.new(profile_visibility: :private)

    assert user.allowed_to_view_profile?(user)
  end

  test "allowed to view profile if the profile is public" do
    user = User.new(profile_visibility: :public)
    user2 = User.new

    assert user.allowed_to_view_profile?(user2)
  end

  test "allowed to view profile if the profile is public and user is nil" do
    user = User.new(profile_visibility: :public)

    assert user.allowed_to_view_profile?(nil)
  end

  test "allowed to view profile if the user follows the profile" do
    user1 = create(:user, profile_visibility: :private)
    user2 = create(:user)
    user2.follows.create(followee_id: user1.id)

    assert user1.allowed_to_view_profile?(user2)
  end

  test "pending_follow_request_for? returns false if user is nil" do
    user = User.new

    assert_not user.pending_follow_request_for?(nil)
  end

  test "pending_follow_request_for? returns false if there is no pending follow request" do
    user1 = create(:user, profile_visibility: :private)
    user2 = create(:user)

    assert_not user1.pending_follow_request_for?(user2)
  end

  test "pending_follow_request_for? returns true if there is a pending follow request" do
    user1 = create(:user, profile_visibility: :private)
    user2 = create(:user)
    create(:follow_request, requester: user2, followee: user1)

    assert user1.pending_follow_request_for?(user2)
  end

  test "goals_progress_calendar builds a progress calendar" do
    user = create(:user)
    goal = create(:goal, user:)
    create(:goal_progress_change, goal:, created_at: Date.new(2025, 1, 1))

    progress_calendar = user.goals_progress_calendar

    assert_instance_of ProgressCalendar, progress_calendar
  end

  test "goals_progress_calendar builds a progress calendar for the last 2 months" do
    travel_to Date.new(2025, 4, 1)

    user = create(:user)
    progress_calendar = user.goals_progress_calendar

    assert_equal Date.new(2025, 2, 1), progress_calendar.days.first.date
    assert_equal Date.new(2025, 4, 30), progress_calendar.days.last.date
  end

  test "username is valid" do
    %w[
      test
      abcd.abcd
      1234
      test.1234
      ____
    ].each do |username|
      user = build(:user, username: username)

      assert user.valid?
    end
  end

  test "username cannot start with a dot" do
    user = build(:user, username: ".test")

    assert_not user.valid?
  end

  test "username cannot end with a dot" do
    user = build(:user, username: "test.")

    assert_not user.valid?
  end

  test "username cannot have two dots in a row" do
    user = build(:user, username: "test..test")

    assert_not user.valid?
  end

  test "username cannot have three dots in a row" do
    user = build(:user, username: "test...test")

    assert_not user.valid?
  end
end
