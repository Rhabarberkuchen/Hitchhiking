class CreateFriendRequest < ActiveRecord::Migration[5.1]
  def change
    create_table :friend_requests do |t|
      t.references :requester, index: true
      t.references :user,  index: true, foreign_key: true
    end

    add_foreign_key :friend_requests, :users, column: :user_id
    add_index :friend_requests, [:user_id, :requester_id], unique: :true
  end
end
