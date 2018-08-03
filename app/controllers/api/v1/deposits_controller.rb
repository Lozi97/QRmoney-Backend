class Api::V1::DepositsController < ApplicationController
  before_action :set_deposit, only: [:show, :update, :destroy]
  skip_before_action :authenticate_request

  # GET /deposits
  def index
    @deposits = Deposit.all

    render json: @deposits
  end

  # GET /deposits/1
  def show
    render json: @deposit
  end

  # POST /deposits
  def create
    @deposit = Deposit.new(deposit_params)

    if @deposit.save
      render json: @deposit, status: :created
    else
      render json: @deposit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /deposits/1
  def update
    if @deposit.update(deposit_params)
      render json: @deposit
    else
      render json: @deposit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /deposits/1
  def destroy
    @deposit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deposit
      @deposit = Deposit.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def deposit_params
      params.permit(:operation_date, :from_user_id, :to_hajji_id, :amount)
    end
end
