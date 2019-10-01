class CreatePros < ActiveRecord::Migration[5.2]
  def change
    create_table :pros do |t|
      t.string :name
      t.text :address
      t.integer :lat
      t.integer :lng
      t.integer :max_kilometers

      t.timestamps
    end
  end
end
