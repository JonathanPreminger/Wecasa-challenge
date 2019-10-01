class CreateOpenningHours < ActiveRecord::Migration[5.2]
  def change
    create_table :openning_hours do |t|
      t.string :day
      t.datetime :starts_at
      t.datetime :ends_at
      t.references :pro, foreign_key: true

      t.timestamps
    end
  end
end
