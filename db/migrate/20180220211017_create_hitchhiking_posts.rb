class CreateHitchhikingPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :hitchhiking_posts do |t|
      t.string :start
      t.string :destination
      t.time :time
      t.integer :stops

      t.timestamps
    end
  end
end
