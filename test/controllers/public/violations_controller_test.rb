require 'test_helper'

class Public::ViolationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_violations_create_url
    assert_response :success
  end

  test "should get destroy" do
    get public_violations_destroy_url
    assert_response :success
  end

end
