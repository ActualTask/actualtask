class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.integer :task_id
      t.string :lat
      t.string :long
      t.string :location_name

    end
  end
end
