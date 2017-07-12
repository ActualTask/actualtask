class CreateInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :infos do |t|
      t.string :name
      t.string :surname
      t.text :adress
      t.text :phone



      t.timestamps
    end
  end
end
