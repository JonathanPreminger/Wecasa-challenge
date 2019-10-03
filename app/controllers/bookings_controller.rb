class BookingsController < ApplicationController
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
    @pros = Pro.all
    @booking = Booking.find(params[:id])
    @skills_required = []
    @booking.prestations.each do |presta|
      @skills_required << presta.reference
    end
    who_got_the_skills
    match_datetime
  end

  def who_got_the_skills
    @skills_availlable = []
    @pro_valid = []
    @pros.each do |pro|
      @name = pro.name
      @skills_availlable.clear
      pro.prestations.each do |presta_availlable|
        @skills_availlable << presta_availlable.reference
      end
      @y = 0
      @pi = @skills_required.size
      @skills_required.each do |x|
        if @skills_availlable.include?(x)
          @y = @y + 1
        else
          @y= @y - 1
        end
      end
      if @y ==  @pi
          @pro_valid << pro.name
        end
    end
  end

  def match_datetime
    match_day
    match_hour
  end

  def match_day
    @get_pro_back_for_day_tchek = []
    @pro_day_available = []
    @pro_valid.each do |p|
      @get_pro_back_for_day_tchek << Pro.find_by(name:p)
    end
    @get_pro_back_for_day_tchek.each do |g|
      g.openning_hours.each do |a|
        if a.day == @booking.starts_at.strftime("%A").downcase
          @pro_day_available << g.name
        end
      end
    end
  end

  def match_hour
    @get_pro_back_for_hour_tchek = []
    @pro_hour_available = []
    @pro_day_available.each do |p|
      @get_pro_back_for_hour_tchek << Pro.find_by(name:p)
    end
    @get_pro_back_for_hour_tchek.each do |g|
      g.openning_hours.each do |a|
        @t =  @booking.starts_at + 2*60*60
        if  @t.strftime("%I:%M%p").between?(a.starts_at.strftime("%I:%M%p"), a.ends_at.strftime("%I:%M%p"))
          @pro_hour_available << g.name
        end
      end
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def index
    @bookings  = Booking.all
  end

  def destroy
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:name, :email, :address, :lat, :lng, :starts_at, booking_prestations_attributes: [:id, :booking_id, :prestation_id, :_destroy], prestations_attributes: [:id, :reference, :duration])
  end
end
