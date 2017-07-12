class RemoveTableGusers < ActiveRecord::Migration[5.1]
  def change
    drop_table :gusers
  end
end
