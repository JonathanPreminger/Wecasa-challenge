class CreateAppointements < ActiveRecord::Migration[5.2]
  def change
    create_table :appointements do |t|
      t.datetime :starts_at
      t.datetime :ends_at
      t.references :pro, foreign_key: true

      t.timestamps
    end
  end
end
