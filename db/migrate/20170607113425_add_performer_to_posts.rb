class AddPerformerToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :performers, :integer, default:0
  end
end
