class ProPrestationsController < ApplicationController
  def create
    @pro_prestation = ProPrestation.create(pro_prestation_params)
  end
  def index
    @prestation = Prestation.all
    @pros = Pro.all
    @pro_prestations  = ProPrestation.all
    @booking  = Booking.all
    @booking_prestations  = BookingPrestation.all
    if @pro_prestations.blank?
    ProPrestation.populate_from_json
    end

  end

  private

  def pro_prestation_parmas
    params.permit(:pro_prestation).require(:pro_id, :prestation_id)
  end

end
