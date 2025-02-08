require "test_helper"

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "new returns a success response if the entry belongs to the current user" do
    user = create(:user)
    entry = create(:entry, :post, owner: user)

    sign_in user

    get new_entry_comment_url(entry), headers: { "Turbo-Frame" => "frame" }

    assert_response :success
  end

  test "new returns a success response if the entry belongs to any of the current users's followees" do
    user1 = create(:user)
    user2 = create(:user)
    entry = create(:entry, :post, owner: user2)
    create(:follow, follower: user1, followee: user2)

    sign_in user1

    get new_entry_comment_url(entry), headers: { "Turbo-Frame" => "frame" }

    assert_response :success
  end

  test "new returns not found response if the entry does not belong to current user" do
    user = create(:user)
    entry = create(:entry, :post)

    sign_in user

    get new_entry_comment_url(entry), headers: { "Turbo-Frame" => "frame" }

    assert_response :not_found
  end

  test "new returns not found response if the entry does not belong to current user's followees" do
    user1 = create(:user)
    user2 = create(:user)
    entry = create(:entry, :post)
    create(:follow, follower: user1, followee: user2)

    sign_in user1

    get new_entry_comment_url(entry), headers: { "Turbo-Frame" => "frame" }

    assert_response :not_found
  end

  test "index returns a success response if the entry belongs to the current user" do
    user = create(:user)
    entry = create(:entry, :post, owner: user)

    sign_in user

    get entry_comments_url(entry, format: :turbo_stream), headers: { "Turbo-Frame" => "frame" }

    assert_response :success
  end

  test "index returns a success response if the entry belongs to any of the current users's followees" do
    user1 = create(:user)
    user2 = create(:user)
    entry = create(:entry, :post, owner: user2)
    create(:follow, follower: user1, followee: user2)

    sign_in user1

    get entry_comments_url(entry, format: :turbo_stream), headers: { "Turbo-Frame" => "frame" }

    assert_response :success
  end

  test "index returns not found response if the entry does not belong to current user" do
    user = create(:user)
    entry = create(:entry, :post)

    sign_in user

    get entry_comments_url(entry, format: :turbo_stream), headers: { "Turbo-Frame" => "frame" }

    assert_response :not_found
  end

  test "index returns not found response if the entry does not belong to current user's followees" do
    user1 = create(:user)
    user2 = create(:user)
    entry = create(:entry, :post)
    create(:follow, follower: user1, followee: user2)

    sign_in user1

    get entry_comments_url(entry, format: :turbo_stream), headers: { "Turbo-Frame" => "frame" }

    assert_response :not_found
  end

  test "creates a comment for the current user given an entry" do
    user = create(:user)
    entry = create(:entry, :post, owner: user)
    params = {
      comment: attributes_for(:comment)
    }

    sign_in user

    post entry_comments_url(entry, format: :turbo_stream), headers: { "Turbo-Frame" => "frame" }, params: params

    assert_response :success

    comment = Comment.last

    assert_equal comment.owner, user
  end

  test "creates a comment for the current user followee given an entry" do
    user1 = create(:user)
    user2 = create(:user)
    entry = create(:entry, :post, owner: user2)
    create(:follow, follower: user1, followee: user2)
    params = {
      comment: attributes_for(:comment)
    }

    sign_in user1

    post entry_comments_url(entry, format: :turbo_stream), headers: { "Turbo-Frame" => "frame" }, params: params

    assert_response :success

    comment = Comment.last

    assert_equal comment.owner, user2
  end

  test "create returns a not found response when the current user has no access to a given entry" do
    user = create(:user)
    entry = create(:entry, :post)
    params = {
      comment: attributes_for(:comment)
    }

    sign_in user

    post entry_comments_url(entry, format: :turbo_stream), headers: { "Turbo-Frame" => "frame" }, params: params

    assert_response :not_found
  end
end
