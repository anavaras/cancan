require 'test_helper'

class CancanControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cancan_index_url
    assert_response :success
  end

end
