class DeletePostsPassword < ActiveRecord::Migration[5.1]
  def change
remove_column :posts, :password
  end
end
