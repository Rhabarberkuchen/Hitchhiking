class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :hh_attribute, foreign_key: true

      t.timestamps
    end
  end
end
