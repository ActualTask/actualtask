class RemoveColumnFromTasks < ActiveRecord::Migration[5.1]
  def change
    remove_column :tasks, :performers, :integer
    remove_column :tasks, :selected_performer, :integer
    remove_column :tasks, :checkpost, :boolean
    remove_column :tasks, :verified, :boolean
  end
end
