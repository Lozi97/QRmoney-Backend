require 'test_helper'

class DepositsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deposit = deposits(:one)
  end

  test "should get index" do
    get deposits_url, as: :json
    assert_response :success
  end

  test "should create deposit" do
    assert_difference('Deposit.count') do
      post deposits_url, params: { deposit: { amount: @deposit.amount, from_user_id: @deposit.from_user_id, operation_date: @deposit.operation_date, to_hajji_id: @deposit.to_hajji_id } }, as: :json
    end

    assert_response 201
  end

  test "should show deposit" do
    get deposit_url(@deposit), as: :json
    assert_response :success
  end

  test "should update deposit" do
    patch deposit_url(@deposit), params: { deposit: { amount: @deposit.amount, from_user_id: @deposit.from_user_id, operation_date: @deposit.operation_date, to_hajji_id: @deposit.to_hajji_id } }, as: :json
    assert_response 200
  end

  test "should destroy deposit" do
    assert_difference('Deposit.count', -1) do
      delete deposit_url(@deposit), as: :json
    end

    assert_response 204
  end
end
