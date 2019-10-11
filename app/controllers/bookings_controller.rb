class BookingsController < ApplicationController
  include Matching
  require 'set'
  require "time"

  def create
    @booking = Booking.create!(booking_params)
    redirect_to bookings_path
  end

  def new
    @booking = Booking.new(params[:booking])
  end

  def show
    @booking = Booking.find(params[:id])
    find_pro
  end

  def index
    @bookings  = Booking.all
  end

  private

  def booking_params
    params.require(:booking).permit(:name, :email, :address, :lat, :lng, :starts_at, booking_prestations_attributes: [:id, :booking_id, :prestation_id, :_destroy], prestations_attributes: [:id, :reference, :duration])
  end
end
