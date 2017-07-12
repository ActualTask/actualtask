class AddLocationToInfos < ActiveRecord::Migration[5.1]
  def change
    add_column :infos, :location, :string
  end
end
