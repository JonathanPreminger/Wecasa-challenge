require 'rails_helper'

RSpec.describe Booking, :type => :model do
  it "is valid with valid attributes" do
    expect(Booking.new).to_not be_valid
end

  describe 'Database' do
    it { is_expected.to have_db_column(:email).of_type(:string)}
    it { is_expected.to have_db_column(:name).of_type(:string)}
    it { is_expected.to have_db_column(:starts_at).of_type(:datetime)}
    it { is_expected.to have_db_column(:address).of_type(:text)}
    it { is_expected.to have_db_column(:lat).of_type(:integer) }
    it { is_expected.to have_db_column(:lng).of_type(:integer) }
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
  end

  context "Validations" do

    it 'should reject a booking with wrong email format' do
      Booking.destroy_all
      @booking = Booking.create(name:"Alex",email:"alexhotmailfr")
      expect(Booking.count).to eq(0)
    end

    it 'should persist a booking with good email format' do
      Booking.destroy_all
      @booking = Booking.create(name:"Alex",email:"alex@hotmail.fr")
      expect(Booking.count).to eq(1)
    end
  end


  context 'Associations' do

    describe 'Associations' do
    end

    it "should have many prestations" do
      subject { described_class.new }
      assc = described_class.reflect_on_association(:prestations)
      expect(assc.macro).to eq :has_many
    end

    it "should have many booking_prestations" do
      subject { described_class.new }
      assc = described_class.reflect_on_association(:booking_prestations)
      expect(assc.macro).to eq :has_many
    end
  end
end
