require 'test_helper'

class CategoriessControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get categoriess_index_url
    assert_response :success
  end

  test "should get edit" do
    get categoriess_edit_url
    assert_response :success
  end

end
