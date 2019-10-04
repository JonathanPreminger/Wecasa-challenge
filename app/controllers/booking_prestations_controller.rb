class BookingPrestationsController < ApplicationController

  def create
    @booking_prestation = BookingPrestation.create!(booking_prestation_params)
  end
  
  def index
    @booking_prestations  = BookingPrestation.all
    end

  private

  def booking_prestation_params
    params.permit(:booking_prestation).require(:booking_id, :prestation_id, prestations: [:id, :reference, :duration])
  end

end
