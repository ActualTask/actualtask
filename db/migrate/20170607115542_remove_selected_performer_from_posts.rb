class RemoveSelectedPerformerFromPosts < ActiveRecord::Migration[5.1]
  def down
    remove_column :tasks, :selected_performer, :integer
  end
end
