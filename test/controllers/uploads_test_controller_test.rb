require 'test_helper'

class UploadsTestControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get uploads_test_new_url
    assert_response :success
  end

end
