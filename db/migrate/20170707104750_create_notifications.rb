class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.string :header_ru
      t.string :header_en
      t.string :header_ua
      t.text :text_ru
      t.text :text_en
      t.text :text_ua

      t.timestamps
    end
  end
end
