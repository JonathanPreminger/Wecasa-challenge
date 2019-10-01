class CreatePrestations < ActiveRecord::Migration[5.2]
  def change
    create_table :prestations do |t|
      t.string :reference
      t.integer :duration

      t.timestamps
    end
  end
end
