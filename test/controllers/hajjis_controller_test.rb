require 'test_helper'

class HajjisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hajji = hajjis(:one)
  end

  test "should get index" do
    get hajjis_url, as: :json
    assert_response :success
  end

  test "should create hajji" do
    assert_difference('Hajji.count') do
      post hajjis_url, params: { hajji: { balance: @hajji.balance, first_name: @hajji.first_name, last_name: @hajji.last_name, nationality: @hajji.nationality, qr: @hajji.qr } }, as: :json
    end

    assert_response 201
  end

  test "should show hajji" do
    get hajji_url(@hajji), as: :json
    assert_response :success
  end

  test "should update hajji" do
    patch hajji_url(@hajji), params: { hajji: { balance: @hajji.balance, first_name: @hajji.first_name, last_name: @hajji.last_name, nationality: @hajji.nationality, qr: @hajji.qr } }, as: :json
    assert_response 200
  end

  test "should destroy hajji" do
    assert_difference('Hajji.count', -1) do
      delete hajji_url(@hajji), as: :json
    end

    assert_response 204
  end
end
