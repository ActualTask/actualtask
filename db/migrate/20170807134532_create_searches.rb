class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :titlt
      t.integer :category_id
      t.decimal :min_price
      t.decimal :max_price
      t.decimal :price

      t.timestamps
    end
  end
end
