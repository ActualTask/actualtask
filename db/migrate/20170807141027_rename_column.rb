class RenameColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :searches, :titlt, :title
  end
end
