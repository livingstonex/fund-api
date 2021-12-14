class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:show, :update, :destroy]

  # GET /registrations/1
  def show
    render json: @registration.to_frontend
  end

  # POST /registrations
  def create
    @registration = Registration.new(registration_params)

    if @registration.save
      render json: @registration, status: :created, location: @registration
    else
      render json: @registration.errors, status: :unprocessable_entity
    end
  end

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @registration = Registration.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def registration_params
      params.require(:registration).permit(:user_id, :event_id)
    end
end
