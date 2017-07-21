class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_table :task_locating, :task_locatings
  end
end
