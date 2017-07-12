class RenameColumFromTaggings < ActiveRecord::Migration[5.1]
  def change
    rename_column :taggings, :post_id, :task_id

  end
end
