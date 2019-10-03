class Pro < ApplicationRecord
  require 'json'

  has_many :pro_prestations
  has_many :prestations, through: :pro_prestations
  has_many :openning_hours
  has_many :appointments
  validates_uniqueness_of :name


  def self.populate_from_json
    file = File.read('data.json')
    data_hash=JSON.parse(file)
    puts data_hash['pros'].size
    @pros = []
    data_hash['pros'].size.times do |x|
      @pros << data_hash['pros'][x]['name']
      name = data_hash['pros'][x]['name']
      address = data_hash['pros'][x]['address']
      lat = data_hash['pros'][x]['lat']
      lng = data_hash['pros'][x]['lng']
      max_kilometers = data_hash['pros'][x]['max_kilometers']
      id = (x + 1)
      Pro.create(name:name, address:address, lat:lat, lng:lng, max_kilometers:max_kilometers, id:id)
      data_hash['pros'][x]['opening_hours'].size.times do |o|
        day = data_hash['pros'][x]['opening_hours'][o]['day']
        puts day
        starts_at = data_hash['pros'][x]['opening_hours'][o]['starts_at']
        ends_at = data_hash['pros'][x]['opening_hours'][o]['ends_at']
        OpenningHour.create(day:day, starts_at:starts_at, ends_at:ends_at, pro_id:id )
        puts "_______________________________________________________________________o"
        puts o
        puts OpenningHour.all.inspect
      end
    end
  end
end
