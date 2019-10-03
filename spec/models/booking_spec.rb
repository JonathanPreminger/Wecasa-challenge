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
  end

   describe 'Associations' do
  end
end
