class AddColumnToPerformers < ActiveRecord::Migration[5.1]
  def change
    add_column :performers, :photo_id_1, :string
    add_column :performers, :photo_id_2, :string
  end
end
