class DropUsers < ActiveRecord::Migration[5.1]
def up
  drop_table :users
end

  def down
    create_table "users", force: :cascade do |t|
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "name"
      t.date "birthday"
      t.string "base"
      t.string "countries"
    end
  end
end
