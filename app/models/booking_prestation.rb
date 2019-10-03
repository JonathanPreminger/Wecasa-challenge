class BookingPrestation < ApplicationRecord
  belongs_to :booking
  belongs_to :prestation
  accepts_nested_attributes_for :prestation
  validates :prestation_id, presence: true, allow_nil: true






  def self.populate_from_json
    Booking.populate_from_json
    file = File.read('data.json')
    data_hash=JSON.parse(file)
    data_hash['bookings'].size.times do |x|
      data_hash['bookings'][x]['prestations'].each do |booking_presta|
        puts "name presta"
        puts booking_presta
        @booking_presta = Prestation.find_by(reference:booking_presta)
        "presta id"
        puts @booking_presta.id
        presta_id = @booking_presta.id
        booking_id = x + 1
        puts "B id"
        puts booking_id
        BookingPrestation.create(booking_id:booking_id, prestation_id:presta_id)
        puts "BP count"

      end

 end
 @all = BookingPrestation.all
 puts '____________________________________________booking presta begin'
   @all.each do |x|
     puts 'one line___________________'
     puts x.prestation.reference
     puts 'for'
     puts x.booking.name
     puts 'end line___________________'

   end
  puts "______________________________________________il y a "
  puts BookingPrestation.count
  puts '________________________________________________Booking prestations'
  puts '____________________________________________booking presta end'
  puts BookingPrestation.inspect


 end
end
