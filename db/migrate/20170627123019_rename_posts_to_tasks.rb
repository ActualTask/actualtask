class RenamePostsToTasks < ActiveRecord::Migration[5.1]
  def change
    rename_table :tasks, :tasks
  end
end
