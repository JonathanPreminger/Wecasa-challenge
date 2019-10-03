class BookingsController < ApplicationController
  require 'set'

  def create
    @booking = Booking.create!(booking_params)
<<<<<<< HEAD
     redirect_to bookings_path
=======
    redirect_to @booking
>>>>>>> f3b13f9bc13bfcbf842763c31b32f780ddf1fd4d
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
    distance
  end

  def who_got_the_skills
    @skills_availlable = []
    @pro_valid = []


    @pros.each do |pro|
      puts '_______________________________________________begin pro'
      @name = pro.name
      @skills_availlable.clear
      puts "_________________________________ number of presta for a #{@name}"
      puts pro.prestations.count
       pro.prestations.each do |presta_availlable|
         @skills_availlable << presta_availlable.reference
      end
      puts '___________________________________________________________skills available'

      puts @skills_availlable
      puts '___________________________________________________________skills required'

      puts @skills_required
      @y = 0
      @pi = @skills_required.size
      puts "___________________________________________________@pi"
      puts @pi
      @skills_required.each do |x|
        if @skills_availlable.include?(x)
          puts 'yes'
          @y = @y + 1
          puts '___________________________________________________________@y ='
          puts @y

        else
          puts 'no'
          @y= @y - 1

        end
      end

      if @y ==  @pi
          @pro_valid << pro.name
        end
    end
    puts '___________________________________________________________pro valid'
    puts @pro_valid.inspect
  end

<<<<<<< HEAD
=======
  def distance
    @paris = "Paris"

    @lyon = Geocoder.search("Lyon")

    @add =@booking.address
    @results = Geocoder.search(@add)
    @loc = ["Paris, France"]
    puts '___________________________________________________________last coor'
   puts @lyon.first.coordinates
 puts Booking.near("Vancouver, Canada")

end






>>>>>>> f3b13f9bc13bfcbf842763c31b32f780ddf1fd4d
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
