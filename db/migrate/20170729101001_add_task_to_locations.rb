class AddTaskToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :task_id, :integer
  end
end
