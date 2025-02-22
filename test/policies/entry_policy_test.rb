require "test_helper"

class EntryPolicyTest < ActiveSupport::TestCase
  test "destroy? returns true if user owns the entry" do
    user = build_stubbed(:user)
    entry = build_stubbed(:entry, :post, owner: user)

    policy = EntryPolicy.new(entry, user:)

    assert policy.destroy?
  end

  test "destroy? returns false if user does not own the entry" do
    user = build_stubbed(:user)
    user2 = build_stubbed(:user)
    entry = build_stubbed(:entry, :post, owner: user2)

    policy = EntryPolicy.new(entry, user:)

    assert_not policy.destroy?
  end
end
