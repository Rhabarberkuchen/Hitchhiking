class CreateHhAttribute < ActiveRecord::Migration[5.1]
  def change
    create_table :hh_attributes do |t|
      t.time :time
      t.integer :lifts
      t.references :simple_post, foreign_key: true
    end
  end
end
