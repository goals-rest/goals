require "test_helper"

class Entries::LikesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    user = create(:user)
    entry = create(:entry, :post, owner: user)

    sign_in user
    get entry_likes_url(entry), headers: { "Turbo-Frame" => "frame" }

    assert_response :success
  end

  test "creates a like if the entry belongs to current user" do
    user = create(:user)
    entry = create(:entry, :post, owner: user)

    sign_in user

    assert_difference "Entry::Like.count", +1 do
      post entry_like_url(entry, format: :turbo_stream)
    end

    like = Entry::Like.last

    assert_response :success
    assert user, like.user
  end

  test "creates a like for a given entry" do
    user = create(:user)
    entry = create(:entry, :post, owner: user)

    sign_in user

    assert_difference "Entry::Like.count", +1 do
      post entry_like_url(entry, format: :turbo_stream)
    end

    like = Entry::Like.last

    assert_response :success
    assert entry, like.entry
  end

  test "creates a like if the entry belongs to one of the current user's followees" do
    user1 = create(:user)
    user2 = create(:user)
    entry = create(:entry, :post, owner: user2)
    create(:follow, follower: user1, followee: user2)

    sign_in user1

    assert_difference "Entry::Like.count", +1 do
      post entry_like_url(entry, format: :turbo_stream)
    end

    like = Entry::Like.last

    assert_response :success
    assert user1, like.user
  end

  test "doesn't create a like if the entry doesn't belong to current user's followees" do
    current_user = create(:user)
    entry = create(:entry, :post, owner: create(:user))

    sign_in current_user

    assert_no_difference "Entry::Like.count" do
      post entry_like_url(entry, format: :turbo_stream)
    end
  end

  # TODO: Uncomment this when the post show page is added
  # test "redirects to the entryable path if the request format is html" do
  #   user = create(:user)
  #   entry = create(:entry, :post, owner: user)
  #
  #   sign_in user
  #
  #   assert_difference "Entry::Like.count", +1 do
  #     post entry_like_url(entry)
  #   end
  #
  #   assert_response :redirect
  #   assert_redirected_to :post_url
  # end

  # test "redirects to the entryable path if the entry is already liked by the current user" do
  #   user = create(:user)
  #   entry = create(:entry, :post, owner: user)
  #   create(:entry_like, entry:, user:)
  #
  #   sign_in user
  #
  #   assert_no_difference "Entry::Like.count" do
  #     post entry_like_url(entry, format: :turbo_stream)
  #   end
  #
  #   assert_response :redirect
  #   assert_redirected_to :post_url
  # end

  test "destroy a like if the entry belongs to the current user" do
    user = create(:user)
    entry = create(:entry, :post, owner: user)
    create(:entry_like, entry:, user:)

    sign_in user

    assert_difference "Entry::Like.count", -1 do
      delete entry_like_url(entry, format: :turbo_stream)
    end

    assert_response :success
  end

  # test "destroys the like and redirects to the entryable if the request format is html" do
  #   user = create(:user)
  #   entry = create(:entry, :post, owner: user)
  #   create(:entry_like, entry:, user:)
  #
  #   sign_in user
  #
  #   assert_difference "Entry::Like.count", -1 do
  #     delete entry_like_url(entry)
  #   end
  #
  #   assert_response :redirect
  #   assert_redirected_to :post_url
  # end

  test "returns a no_content response if the like is not found" do
    user = create(:user)
    entry = create(:entry, :post, owner: user)

    sign_in user

    delete entry_like_url(entry, format: :turbo_stream)

    assert_response :no_content
  end

  # test "redirects to the entryable path if the like is not found" do
  #   user = create(:user)
  #   entry = create(:entry, :post, owner: user)
  #
  #   sign_in user
  #
  #   assert_difference "Entry::Like.count", -1 do
  #     delete entry_like_url(entry)
  #   end
  #
  #   assert_response :redirect
  #   assert_redirected_to :post_url
  # end
end
