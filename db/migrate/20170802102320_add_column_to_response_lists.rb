class AddColumnToResponseLists < ActiveRecord::Migration[5.1]
  def change
    remove_column :response_lists, :price, :decimal
    add_column :response_lists, :price_performer, :decimal
  end
end
