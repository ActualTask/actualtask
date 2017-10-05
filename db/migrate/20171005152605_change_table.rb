class ChangeTable < ActiveRecord::Migration[5.1]
  change_table :users do |t|
    t.remove :performer_role
    t.boolean :performer_role, default: false

  end
  end


