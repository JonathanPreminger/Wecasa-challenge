class Booking < ApplicationRecord
require "time"
  has_many :booking_prestations, :validate => false
  has_many :prestations, through: :booking_prestations
  accepts_nested_attributes_for :booking_prestations
  validates :name, :email, presence: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

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
      Booking.create(email:email,name:name, starts_at:starts_at,address:address, latitude:lat, longitude:lng)
    end
  end

  geocoded_by :address
  after_validation :geocode

end
