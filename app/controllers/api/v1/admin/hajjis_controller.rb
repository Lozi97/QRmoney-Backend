class HajjisController < ApplicationController
  before_action :set_hajji, only: [:show, :update, :destroy]

  # GET /hajjis
  def index
    @hajjis = Hajji.all

    render json: @hajjis
  end

  # GET /hajjis/1
  def show
    render json: @hajji
  end

  # POST /hajjis
  def create
    @hajji = Hajji.new(hajji_params)

    if @hajji.save
      render json: @hajji, status: :created, location: @hajji
    else
      render json: @hajji.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hajjis/1
  def update
    if @hajji.update(hajji_params)
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
      @hajji = Hajji.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hajji_params
      params.require(:hajji).permit(:first_name, :last_name, :nationality, :qr, :balance)
    end
end
