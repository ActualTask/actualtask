class DropColumnFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :performer_role
  end
end
