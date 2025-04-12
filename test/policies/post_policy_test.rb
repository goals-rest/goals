require "test_helper"

class PostPolicyTest < ActiveSupport::TestCase
  test "show? returns true if user owns the post and their profile is private" do
    user = create(:user, profile_visibility: :private)
    post = create(:post)
    entry = create(:entry, entryable: post, owner: user)

    policy = PostPolicy.new(post, user:)

    assert policy.apply(:show?)
  end

  test "show? returns false if the post owner's profile is private and the user does not follow them" do
    user = create(:user)
    post_owner = create(:user, profile_visibility: :private)
    post = create(:post)
    entry = create(:entry, entryable: post, owner: post_owner)

    policy = PostPolicy.new(post, user:)

    assert_not policy.apply(:show?)
  end

  test "show? returns true if the post owner's profile is private and the user follows them" do
    user = create(:user)
    post_owner = create(:user, profile_visibility: :private)
    post = create(:post)
    entry = create(:entry, entryable: post, owner: post_owner)
    create(:follow, follower: user, followee: post_owner)

    policy = PostPolicy.new(post, user:)

    assert policy.apply(:show?)
  end

  test "show? returns true if the post owner's profile is public" do
    user = create(:user)
    post_owner = create(:user, profile_visibility: :public)
    post = create(:post)
    entry = create(:entry, entryable: post, owner: post_owner)

    policy = PostPolicy.new(post, user:)

    assert policy.apply(:show?)
  end

  test "show? returns false if the user is not logged in" do
    post_owner = create(:user, profile_visibility: :private)
    post = create(:post)
    entry = create(:entry, entryable: post, owner: post_owner)

    policy = PostPolicy.new(post, user: nil)

    assert_not policy.apply(:show?)
  end
end
