class CreateSimplePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :simple_posts do |t|
      t.references :user, foreign_key: true, index:true
      t.string :title
      t.string :text
      t.string :pictures

      t.timestamps
    end
    add_foreign_key :simple_posts, :users, column: :user_id
    add_index :simple_posts, [:user_id, :created_at], unique: true
  end
end
