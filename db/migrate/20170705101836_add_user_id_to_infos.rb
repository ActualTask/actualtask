class AddUserIdToInfos < ActiveRecord::Migration[5.1]
  def change
    add_column :infos, :user_id, :integer
  end
end
