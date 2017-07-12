class CreateViews < ActiveRecord::Migration[5.1]
  def change
    create_table :views do |t|
      t.text :Name
      t.text :Surname
      t.text :Phone
      t.text :Adress
      t.date :Date
      t.boolean :Gender
      t.text :About




      t.timestamps
    end
  end
end
