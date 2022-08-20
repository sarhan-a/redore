require "test_helper"

class CollectionDatesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get collection_dates_new_url
    assert_response :success
  end

  test "should get create" do
    get collection_dates_create_url
    assert_response :success
  end

  test "should get show" do
    get collection_dates_show_url
    assert_response :success
  end

  test "should get index" do
    get collection_dates_index_url
    assert_response :success
  end
end
