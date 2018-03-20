class AddEmailToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :email, :email
  end
end
