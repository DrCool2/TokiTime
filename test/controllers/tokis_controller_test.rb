require 'test_helper'

class TokisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @toki = tokis(:one)
  end

  test "should get index" do
    get tokis_url
    assert_response :success
  end

  test "should get new" do
    get new_toki_url
    assert_response :success
  end

  test "should create toki" do
    assert_difference('Toki.count') do
      post tokis_url, params: { toki: { clock_in: @toki.clock_in, clock_out: @toki.clock_out, note: @toki.note } }
    end

    assert_redirected_to toki_url(Toki.last)
  end

  test "should show toki" do
    get toki_url(@toki)
    assert_response :success
  end

  test "should get edit" do
    get edit_toki_url(@toki)
    assert_response :success
  end

  test "should update toki" do
    patch toki_url(@toki), params: { toki: { clock_in: @toki.clock_in, clock_out: @toki.clock_out, note: @toki.note } }
    assert_redirected_to toki_url(@toki)
  end

  test "should destroy toki" do
    assert_difference('Toki.count', -1) do
      delete toki_url(@toki)
    end

    assert_redirected_to tokis_url
  end
end
