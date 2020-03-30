require 'test_helper'

class ResidencesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get residences_new_url
    assert_response :success
  end

  test "should get index" do
    get residences_index_url
    assert_response :success
  end

  test "should get edit" do
    get residences_edit_url
    assert_response :success
  end

end
