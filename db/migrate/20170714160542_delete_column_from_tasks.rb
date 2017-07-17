class DeleteColumnFromTasks < ActiveRecord::Migration[5.1]
  def change
    remove_column :tasks, :summary
  end
end
