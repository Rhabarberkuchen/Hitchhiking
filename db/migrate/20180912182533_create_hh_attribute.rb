class CreateHhAttribute < ActiveRecord::Migration[5.1]
  def change
    create_table :hh_attributes do |t|
      t.string :start
      t.string :destination
      t.time :time
      t.integer :stops
      t.references :simple_post, foreign_key: true
    end
  end
end
