class AddColumnFromUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :performer_role, :boolean, default: true
  end
end
