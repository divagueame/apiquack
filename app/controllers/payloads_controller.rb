class PayloadsController < ApplicationController
  before_action :set_payload, only: %i[ show edit update destroy ]

  def index
    @payloads = Payload.all
  end

  def show
  end

  def new
    if(!params[:endpoint_id].nil? && !params[:endpoint_id].empty?)
      @selected_endpoint = Endpoint.find(params[:endpoint_id])
    end


    
    if @selected_endpoint then 
      @endpoints = Endpoint.all
    else 
      @endpoints = Endpoint.search(params) 
    end
    @payload = Payload.new
  end

  def edit
  end

  def create
    @payload = Payload.new(payload_params)
    @expect_success = params[:expect_success].present?
    @endpoint = params[:endpoint_id]
    p params
    # respond_to do |format|
    #   if @payload.save
    #     format.html { redirect_to payload_url(@payload), notice: "Payload was successfully created." }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #   end
    # end
  end

  def update
    respond_to do |format|
      if @payload.update(payload_params)
        format.html { redirect_to payload_url(@payload), notice: "Payload was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @payload.destroy

    respond_to do |format|
      format.html { redirect_to payloads_url, notice: "Payload was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_payload
      @payload = Payload.find(params[:id])
    end

    def payload_params
      params.require(:payload).permit(:data)
    end
end
