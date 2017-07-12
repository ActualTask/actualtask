class RenameColumnPerformerUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :performer, :performer_role
  end
end
