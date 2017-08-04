class AddAvatarToInfos < ActiveRecord::Migration[5.1]
  def change
    add_column :infos, :avatar, :string
  end
end
