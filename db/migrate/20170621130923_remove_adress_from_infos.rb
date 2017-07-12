class RemoveAdressFromInfos < ActiveRecord::Migration[5.1]
  def change
    remove_column :infos, :adress, :text
  end
end
