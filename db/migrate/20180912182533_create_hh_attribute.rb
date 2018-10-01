class CreateHhAttribute < ActiveRecord::Migration[5.1]
  def change
    create_table :hh_attributes do |t|
      t.integer :hours
      t.integer :minutes
      t.integer :days
      t.integer :lifts
      t.references :simple_post, foreign_key: true
      t.references :start
      t.references :destination
      t.string :route
    end
  end
end
