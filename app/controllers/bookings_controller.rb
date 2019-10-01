class BookingsController < ApplicationController
  def create
    @booking = Booking.create(booking_params)
  end

  def new
    @booking = Booking.new(params[:booking])
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def index
    @bookings  = Booking.all
    if @bookings.blank?
    Booking.populate_from_json
    puts '_______________________________________________________________all'
    puts Booking.all
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:name, :email, :address, :lat, :lng, :starts_at, booking_prestations_attributes: [:id, :booking_id, :prestation_id, :_destroy], prestations_attributes: [:id, :reference, :duration])
  end
end
