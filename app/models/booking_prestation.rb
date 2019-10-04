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
        @booking_presta = Prestation.find_by(reference:booking_presta)
        presta_id = @booking_presta.id
        booking_id = x + 1
        BookingPrestation.create(booking_id:booking_id, prestation_id:presta_id)
      end
    end
  end
end
