class CreateTableAchievements < ActiveRecord::Migration[5.1]
  def change
    create_table :achievements do |t|
    t.integer "user_id"
    t.string "name"


    end
  end
end
