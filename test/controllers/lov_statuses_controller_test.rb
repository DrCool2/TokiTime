require 'test_helper'

class LovStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lov_status = lov_statuses(:one)
  end

  test "should get index" do
    get lov_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_lov_status_url
    assert_response :success
  end

  test "should create lov_status" do
    assert_difference('LovStatus.count') do
      post lov_statuses_url, params: { lov_status: { status: @lov_status.status } }
    end

    assert_redirected_to lov_status_url(LovStatus.last)
  end

  test "should show lov_status" do
    get lov_status_url(@lov_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_lov_status_url(@lov_status)
    assert_response :success
  end

  test "should update lov_status" do
    patch lov_status_url(@lov_status), params: { lov_status: { status: @lov_status.status } }
    assert_redirected_to lov_status_url(@lov_status)
  end

  test "should destroy lov_status" do
    assert_difference('LovStatus.count', -1) do
      delete lov_status_url(@lov_status)
    end

    assert_redirected_to lov_statuses_url
  end
end
