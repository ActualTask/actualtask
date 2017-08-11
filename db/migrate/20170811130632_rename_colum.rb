class RenameColum < ActiveRecord::Migration[5.1]
  def change
    rename_column :reviews, :user_reviwed, :user_reviewed
  end
end
