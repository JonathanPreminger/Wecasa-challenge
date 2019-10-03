class ChangeStartsAtToBeDatetimeInBookings < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :starts_at, :datetime
  end
end
