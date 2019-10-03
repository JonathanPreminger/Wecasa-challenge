require 'rails_helper'

RSpec.describe Booking, type: :model do
  before :all do
    Booking.destroy_all
  end

  it 'should persist a booking' do
    @booking = Booking.create(name:"Alex",email:"alex@hotmail.fr")
    expect(Booking.count).to eq(1)
  end

  it 'should delete an booking' do
    @booking = Booking.create(name:"Alex",email:"alex@hotmail.fr")
    @total = Booking.count
    Booking.first.destroy
    expect(Booking.count).to be < @total
  end
end
