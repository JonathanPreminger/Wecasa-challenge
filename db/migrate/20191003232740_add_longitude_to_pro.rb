class AddLongitudeToPro < ActiveRecord::Migration[5.2]
  def change
    add_column :pros, :longitude, :float
  end
end
