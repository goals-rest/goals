require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "new" do
    get new_registration_url
    assert_response :success
  end

  test "when params are valid redirects to root_url" do
    params = {
      user: attributes_for(:user, password: "123456", password_confirmation: "123456")
    }

    post registrations_url, params: params

    assert_response :redirect
    assert_redirected_to root_url
  end

  test "when params are valid creates a new user" do
    params = {
      user: attributes_for(:user, password: "123456", password_confirmation: "123456")
    }

    assert_difference "User.count", +1 do
      post registrations_url, params: params
    end

    assert_response :redirect
  end

  test "when params are invalid returns a unprocessable_entity status" do
    params = {
      user: attributes_for(:user, password_confirmation: "123")
    }

    post registrations_url, params: params

    assert_response :unprocessable_entity
  end
end
