class AddColumnTo < ActiveRecord::Migration[5.1]
  def change
    add_column :moderators, :user_id, :integer
    remove_column :moderators, :enc_password, :string
  end
end
