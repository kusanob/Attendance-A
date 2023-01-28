require 'test_helper'

class BacesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get baces_new_url
    assert_response :success
  end

  test "should get edit" do
    get baces_edit_url
    assert_response :success
  end

end
