class AddDefaultValuesToUserAttributes < ActiveRecord::Migration[5.1]
  def up
    change_column :users, :name, :string, default: "Melinda Musterfrau"
    change_column :users, :base, :string, default: "Utopia"
    change_column :users, :birthday, :date, default: '1990-01-01'
    change_column :users, :countries, :string, default: "Utopia"
#change_column :users, :avatar, :string, default: "app/assets/images/default.jpg"
    change_column :users, :km, :integer, default: 0
  end

  def down
    change_column :users, :name, :string, default: nil
    change_column :users, :base, :string, default: nil
    change_column :users, :birthday, :date, default: nil
    change_column :users, :countries, :string, default: nil
  #  change_column :users, :avatar, :string, default: nil
    change_column :users, :km, :integer, default: nil
  end

end
