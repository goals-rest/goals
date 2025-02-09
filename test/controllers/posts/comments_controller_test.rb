require "test_helper"

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "new returns a success response if the current user owns the entry" do
    user = create(:user, profile_visibility: :private)
    entry = create(:entry, :post, owner: user)

    sign_in user

    get new_entry_comment_url(entry), headers: { "Turbo-Frame" => "frame" }

    assert_response :success
  end

  test "new returns a success response if the entry owner's profile is public" do
    user1 = create(:user)
    user2 = create(:user, profile_visibility: :public)
    entry = create(:entry, :post, owner: user2)

    sign_in user1

    get new_entry_comment_url(entry), headers: { "Turbo-Frame" => "frame" }

    assert_response :success
  end

  test "new returns a success response if the current user follows the entry owner" do
    user1 = create(:user)
    user2 = create(:user, profile_visibility: :private)
    entry = create(:entry, :post, owner: user2)
    create(:follow, follower: user1, followee: user2)

    sign_in user1

    get new_entry_comment_url(entry), headers: { "Turbo-Frame" => "frame" }

    assert_response :success
  end

  test "new redirects to root_url if the entry owner's profile is private" do
    user1 = create(:user)
    user2 = create(:user, profile_visibility: :private)
    entry = create(:entry, :post, owner: user2)

    sign_in user1

    get new_entry_comment_url(entry), headers: { "Turbo-Frame" => "frame" }

    assert_response :redirect
    assert_redirected_to root_url
  end

  test "index returns a success response if the current user owns the entry" do
    user = create(:user, profile_visibility: :private)
    entry = create(:entry, :post, owner: user)

    sign_in user

    get entry_comments_url(entry, format: :turbo_stream), headers: { "Turbo-Frame" => "frame" }

    assert_response :success
  end

  test "index returns a success response if the entry owner's profile is public" do
    user1 = create(:user)
    user2 = create(:user, profile_visibility: :public)
    entry = create(:entry, :post, owner: user2)

    sign_in user1

    get entry_comments_url(entry, format: :turbo_stream), headers: { "Turbo-Frame" => "frame" }

    assert_response :success
  end

  test "index returns a success response if the current user follows the entry owner" do
    user1 = create(:user)
    user2 = create(:user, profile_visibility: :private)
    entry = create(:entry, :post, owner: user2)
    create(:follow, follower: user1, followee: user2)

    sign_in user1

    get entry_comments_url(entry, format: :turbo_stream), headers: { "Turbo-Frame" => "frame" }

    assert_response :success
  end

  test "index redirects to root_url if the entry owner's profile is private" do
    user1 = create(:user)
    user2 = create(:user, profile_visibility: :private)
    entry = create(:entry, :post, owner: user2)

    sign_in user1

    get entry_comments_url(entry, format: :turbo_stream), headers: { "Turbo-Frame" => "frame" }

    assert_response :redirect
    assert_redirected_to root_url
  end

  test "the entry owner can create a comment" do
    user = create(:user)
    entry = create(:entry, :post, owner: user)
    params = {
      comment: attributes_for(:comment)
    }

    sign_in user

    assert_difference -> { entry.comments.count } do
      post entry_comments_url(entry, format: :turbo_stream), params: params
    end

    assert_response :success
  end

  test "the current user can comment on follower entries" do
    user1 = create(:user)
    user2 = create(:user)
    entry = create(:entry, :post, owner: user2)

    create(:follow, follower: user1, followee: user2)

    params = {
      comment: attributes_for(:comment)
    }

    sign_in user1

    assert_difference -> { entry.comments.count } do
      post entry_comments_url(entry, format: :turbo_stream), params: params
    end

    assert_response :success
  end

  test "the current user can comment on public entries" do
    user1 = create(:user)
    user2 = create(:user, profile_visibility: :public)
    entry = create(:entry, :post, owner: user2)

    params = {
      comment: attributes_for(:comment)
    }

    sign_in user1

    assert_difference -> { entry.comments.count } do
      post entry_comments_url(entry, format: :turbo_stream), params: params
    end

    assert_response :success
  end

  test "the current user can't comment on private entries" do
    user1 = create(:user)
    user2 = create(:user, profile_visibility: :private)
    entry = create(:entry, :post, owner: user2)

    params = {
      comment: attributes_for(:comment)
    }

    sign_in user1

    assert_no_difference -> { entry.comments.count } do
      post entry_comments_url(entry, format: :turbo_stream), params: params
    end

    assert_response :redirect
    assert_redirected_to root_url
  end

  test "the current user can on entries from users they don't follow" do
    user1 = create(:user)
    user2 = create(:user)
    entry = create(:entry, :post, owner: user2)

    params = {
      comment: attributes_for(:comment)
    }

    sign_in user1

    assert_difference -> { entry.comments.count } do
      post entry_comments_url(entry, format: :turbo_stream), params: params
    end

    assert_response :success
  end
end
