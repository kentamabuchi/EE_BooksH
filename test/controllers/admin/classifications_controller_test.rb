require 'test_helper'

class Admin::ClassificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_classifications_index_url
    assert_response :success
  end

end
