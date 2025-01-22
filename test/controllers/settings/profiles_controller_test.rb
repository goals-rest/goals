require "test_helper"

module Settings
  class ProfilesControllerTest < ActionDispatch::IntegrationTest
    test "edit" do
      user = create(:user)

      sign_in user

      get edit_settings_profile_url

      assert_response :success
    end

    test "updates the user settings" do
      user = create(
        :user,
        first_name: "John",
        last_name: "Doe",
        email_address: "john.doe@example.com",
        username: "john.doe",
        password: "123456",
        avatar: nil
      )

      params = {
        user: {
          first_name: "Michael",
          last_name: "Scott",
          email_address: "michael.scott@example.com",
          username: "michael.scott",
          new_password: "1234568910",
          current_password: "123456",
          avatar: file_fixture_upload("avatar_placeholder.png", "image/png")
        }
      }

      sign_in user

      patch settings_profile_url, params: params

      user.reload

      assert_response :redirect
      assert_equal "Michael", user.first_name
      assert_equal "Scott", user.last_name
      assert_equal "michael.scott@example.com", user.email_address
      assert_equal "michael.scott", user.username
      assert user.authenticate("1234568910")
      assert user.avatar.present?
    end

    test "when the current password is not correct" do
      user = create(
        :user,
        password: "123456"
      )

      params = {
        user: {
          password: "123",
          current_password: "123"
        }
      }

      sign_in user

      patch settings_profile_url, params: params

      assert_response :unprocessable_entity
    end
  end
end
