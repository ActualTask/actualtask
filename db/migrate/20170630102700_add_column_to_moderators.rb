class AddColumnToModerators < ActiveRecord::Migration[5.1]
  def change
    add_column :moderators, :login, :string
    add_column :moderators, :name, :string
    add_column :moderators, :last_name, :string
    add_column :moderators, :enc_password, :string
  end
end
