class Api::V1::WithdrawsController < ApplicationController
  before_action :set_withdraw, only: [:show, :update, :destroy]
  skip_before_action :authenticate_request

  # GET /withdraws
  def index
    @withdraws = Withdraw.all

    render json: @withdraws
  end

  # GET /withdraws/1
  def show
    render json: @withdraw
  end

  # POST /withdraws
  def create
    @withdraw = Withdraw.new(withdraw_params)

    if @withdraw.save
      render json: @withdraw, status: :created, location: @withdraw
    else
      render json: @withdraw.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /withdraws/1
  def update
    if @withdraw.update(withdraw_params)
      render json: @withdraw
    else
      render json: @withdraw.errors, status: :unprocessable_entity
    end
  end

  # DELETE /withdraws/1
  def destroy
    @withdraw.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_withdraw
      @withdraw = Withdraw.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def withdraw_params
      params.permit(:operation_date, :from_hajji_id, :to_user_id, :amount)
    end
end
