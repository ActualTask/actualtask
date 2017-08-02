class AddColumnToResponse < ActiveRecord::Migration[5.1]
  def change
    remove_column :response_lists, :price_performer, :decimal

  end
end
