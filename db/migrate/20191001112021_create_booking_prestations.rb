class CreateBookingPrestations < ActiveRecord::Migration[5.2]
  def change
    create_table :booking_prestations do |t|
      t.references :booking, foreign_key: true
<<<<<<< HEAD
      t.references :prestation, foreign_key: true, null: true
=======
      t.references :prestation, foreign_key: true, :default => " "
>>>>>>> f3b13f9bc13bfcbf842763c31b32f780ddf1fd4d

      t.timestamps
    end
  end
end
