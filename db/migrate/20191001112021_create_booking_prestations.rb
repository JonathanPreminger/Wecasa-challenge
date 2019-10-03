class CreateBookingPrestations < ActiveRecord::Migration[5.2]
  def change
    create_table :booking_prestations do |t|
      t.references :booking, foreign_key: true
      t.references :prestation, foreign_key: true, :default => " "

      t.timestamps
    end
  end
end
