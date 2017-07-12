class AddColumnToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :moderator_id, :integer, default: 0
    add_column :tasks, :performer_id, :integer, default: 0
  end
end
