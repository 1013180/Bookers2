require 'test_helper'

class SerachesControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get seraches_search_url
    assert_response :success
  end

end
