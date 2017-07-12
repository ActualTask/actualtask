class AddColumnsToInfos < ActiveRecord::Migration[5.1]
  def change
    add_column :infos, :dob, :date
    add_column :infos, :about, :text
  end
end
