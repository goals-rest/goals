require "test_helper"

class ProfilesPolicyTest < ActiveSupport::TestCase
  test "sets the profile owner" do
    user = build_stubbed(:user)

    policy = ProfilesPolicy.new(user: nil, profile_owner: user)

    assert policy.profile_owner
  end
end
