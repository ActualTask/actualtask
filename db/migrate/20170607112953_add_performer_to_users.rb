class AddPerformerToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :performers, :integer, default: false
  end
end
