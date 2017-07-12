class AddCheckToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :checkpost, :boolean, default: false
  end
end
