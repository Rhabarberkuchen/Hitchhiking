class AddKmToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :km, :integer
  end
end
