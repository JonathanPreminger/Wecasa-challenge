class Prestation < ApplicationRecord
  has_many :pro_prestations
  has_many :pros, through: :pro_prestations
  has_many :booking_prestations
  has_many :bookings, through: :booking_prestations

  def self.populate_from_json
    file = File.read('data.json')
    data_hash=JSON.parse(file)
    puts data_hash['prestations'].size
    @prestations = []
    @duration = []
    data_hash['prestations'].size.times do |x|
      @prestations << data_hash['prestations'][x]['reference']
      @duration << data_hash['prestations'][x]['duration']
      reference = data_hash['prestations'][x]['reference']
      duration = data_hash['prestations'][x]['duration']
      Prestation.create(reference:reference, duration:duration)
    end
  end
end
