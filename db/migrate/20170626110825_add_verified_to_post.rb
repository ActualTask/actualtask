class AddVerifiedToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :verified, :boolean
  end
end
