class DeletePostsEmail < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :email
  end
end
