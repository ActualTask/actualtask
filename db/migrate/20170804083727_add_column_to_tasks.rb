class AddColumnToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :price, :decimal
  end
end
