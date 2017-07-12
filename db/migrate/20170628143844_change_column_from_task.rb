class ChangeColumnFromTask < ActiveRecord::Migration[5.1]
  def change
    change_column :tasks, :start_time, :datetime
    change_column :tasks, :end_time, :datetime
  end
end
