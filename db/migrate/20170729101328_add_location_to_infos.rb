class AddLocationToInfos < ActiveRecord::Migration[5.1]
  def change
    add_column :infos, :latitude, :float
    add_column :infos, :longitude, :float
    add_column :infos, :city, :string
    add_column :infos, :country_code, :string
    add_column :infos, :address, :string
  end
end
