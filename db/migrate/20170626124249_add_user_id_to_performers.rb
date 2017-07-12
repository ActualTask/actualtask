class AddUserIdToPerformers < ActiveRecord::Migration[5.1]
  def change
    add_column :performers, :user_id, :integer
  end
end
