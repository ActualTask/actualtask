class DeleteModerators < ActiveRecord::Migration[5.1]
  def change
    drop_table :moderators
  end
end
