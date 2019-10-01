class CreateProPrestations < ActiveRecord::Migration[5.2]
  def change
    create_table :pro_prestations do |t|
      t.references :pro, foreign_key: true
      t.references :prestation, foreign_key: true

      t.timestamps
    end
  end
end
