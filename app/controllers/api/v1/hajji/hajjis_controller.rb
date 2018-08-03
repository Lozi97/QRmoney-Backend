class Api::V1::Hajji::HajjisController < ApplicationController
  before_action :set_hajji, only: [:show, :update, :destroy]
  skip_before_action :authenticate_request


  # GET /hajjis
  def index
    @hajjis = ::Hajji.all

    render json: @hajjis
  end

  # GET /hajjis/1
  def show
    render json: @hajji
  end

  def getHajjiByQR
    @hajji = ::Hajji.where(qr: params[:qr])
    render json: @hajji
  end 

  # POST /hajjis
  def create
    @hajji = ::Hajji.new(hajji_params)

    if @hajji.save
      render json: @hajji, status: :created
    else
      render json: @hajji.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hajjis/1
  def update
    if @hajji.update(balance: params[:balance])
      render json: @hajji
    else
      render json: @hajji.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hajjis/1
  def destroy
    @hajji.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hajji
      @hajji = ::Hajji.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hajji_params
      params.permit(:first_name, :last_name, :nationality, :qr, :balance, :bin_code)
    end
end
