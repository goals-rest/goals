require "test_helper"

module Profiles
  class FeedEntryTest < ActiveSupport::TestCase
    test "destroy? returns true if the profile owner owns the entry and the current user is the profile owner" do
      user = build_stubbed(:user)
      entry = build_stubbed(:entry, :post, owner: user)

      policy = Profiles::FeedEntryPolicy.new(entry, user:, profile_owner: user)

      assert policy.destroy?
    end

    test "destroy? returns false if the profile owner does not own the entry" do
      user = build_stubbed(:user)
      entry = build_stubbed(:entry, :post)

      policy = Profiles::FeedEntryPolicy.new(entry, user:, profile_owner: user)

      assert_not policy.destroy?
    end

    test "destroy? returns false if the current user is not the profile owner" do
      profile_owner = build_stubbed(:user)
      user = build_stubbed(:user)
      entry = build_stubbed(:entry, :post, owner: profile_owner)

      policy = Profiles::FeedEntryPolicy.new(entry, user:, profile_owner: profile_owner)

      assert_not policy.destroy?
    end

    test "destroy? returns false if the current user is nil" do
      profile_owner = build_stubbed(:user)
      entry = build_stubbed(:entry, :post, owner: profile_owner)

      policy = Profiles::FeedEntryPolicy.new(entry, user: nil, profile_owner: profile_owner)

      assert_not policy.destroy?
    end
  end
end
