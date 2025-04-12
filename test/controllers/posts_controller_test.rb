require "test_helper"
require "action_policy/test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  include ActionPolicy::TestHelper

  test "new" do
    user = create(:user)

    sign_in user

    get new_post_url
    assert_response :success
  end

  test "show" do
    user = create(:user)
    post = create(:post)
    entry = create(:entry, entryable: post, owner: user)

    sign_in user

    get post_url(post)
    assert_response :success
  end

  test "show returns success response for turbo stream format" do
    user = create(:user)
    post = create(:post)
    entry = create(:entry, entryable: post, owner: user)

    sign_in user

    get post_url(post, format: :turbo_stream)
    assert_response :success
  end

  test "show is authorized" do
    user = create(:user)
    post = create(:post)
    entry = create(:entry, entryable: post, owner: user)

    sign_in user

    assert_authorized_to(:show?, post, with: PostPolicy) do
      get post_url(post)
    end
  end

  test "can create post" do
    user = create(:user)

    sign_in user

    assert_difference("Post.count") do
      post posts_url, params: { post: attributes_for(:post) }
    end

    assert_redirected_to home_path
  end

  test "can create post with images" do
    user = create(:user)
    params = {
      post: attributes_for(
        :post,
        images: [
          file_fixture_upload("avatar_placeholder.png", "image/png")
        ]
      )
    }

    sign_in user

    assert_difference("Post.count") do
      post posts_url, params:
    end

    post = Post.last

    assert_redirected_to home_path
    assert_equal 1, post.images.count
  end

  test "cannot create post" do
    user = create(:user)

    sign_in user

    assert_no_difference("Post.count") do
      post posts_url, params: { post: { title: "" } }
    end

    assert_response :unprocessable_entity
  end
end
