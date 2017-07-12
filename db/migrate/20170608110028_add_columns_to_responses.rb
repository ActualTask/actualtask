class AddColumnsToResponses < ActiveRecord::Migration[5.1]
  def change
    add_column :responses, :price, :decimal
  end
end
