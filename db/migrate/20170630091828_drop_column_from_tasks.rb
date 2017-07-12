class DropColumnFromTasks < ActiveRecord::Migration[5.1]
  def change
    remove_column :tasks, :performer_id, :integer
    remove_column :tasks, :moderator_id, :integer
    add_column :tasks, :performer_id, :integer
    add_column :tasks, :moderator_id, :integer
  end
end
