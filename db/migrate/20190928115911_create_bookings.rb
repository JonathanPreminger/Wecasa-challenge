class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :email
      t.string :name
      t.date :starts_at
      t.text :address
      t.integer :lat
      t.integer :lng

      t.timestamps
    end
  end
end
