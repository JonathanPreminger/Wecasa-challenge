class AddLatitudeToPro < ActiveRecord::Migration[5.2]
  def change
    add_column :pros, :latitude, :float
  end
end
