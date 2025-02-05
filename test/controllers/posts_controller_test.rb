require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "new" do
    user = create(:user)

    sign_in user

    get new_post_url
    assert_response :success
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
