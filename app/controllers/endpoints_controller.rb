class EndpointsController < ApplicationController
  before_action :set_endpoint, only: %i[ show edit update destroy ]

  def index
    @endpoints = Endpoint.all
  end

  def show
  end

  def new
    @endpoint = Endpoint.new
    @endpoint.payloads.build
  end

  def edit
  end

  def create
    @endpoint = Endpoint.new(endpoint_params)

    respond_to do |format|
      if @endpoint.save
        format.html { redirect_to endpoint_url(@endpoint), notice: "Endpoint was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @endpoint.update(endpoint_params)
        format.html { redirect_to endpoint_url(@endpoint), notice: "Endpoint was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @endpoint.destroy

    respond_to do |format|
      format.html { redirect_to endpoints_url, notice: "Endpoint was successfully destroyed." }
    end
  end

  private
    def set_endpoint
      @endpoint = Endpoint.find(params[:id])
    end

    def endpoint_params
      params.require(:endpoint).permit(:name, :url, :description, payloads_attributes: [:id, :data])
    end
end
