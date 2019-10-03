class Booking < ApplicationRecord
require "time"
  has_many :booking_prestations, :validate => false

  has_many :prestations, through: :booking_prestations
  accepts_nested_attributes_for :booking_prestations

  def self.populate_from_json
    file = File.read('data.json')
    data_hash=JSON.parse(file)
    puts data_hash['bookings'].size
    data_hash['bookings'].size.times do |x|
      email = data_hash['bookings'][x]['email']
      name = data_hash['bookings'][x]['name']
      s = Time.iso8601(data_hash['bookings'][x]['starts_at'])
      starts_at = s
      address = data_hash['bookings'][x]['address']
      lat  = data_hash['bookings'][x]['lat']
      lng  = data_hash['bookings'][x]['lng']
      Booking.create(email:email,name:name, starts_at:starts_at,address:address, lat:lat, lng:lng)
      puts data_hash['bookings'][x]['starts_at']
      puts s
      end
      puts Booking.first.inspect
  end
  puts '____________________________________________booking'
  puts Booking.all.inspect
  puts '____________________________________________booking'
  puts '____________________________________________________________test_date'


end
