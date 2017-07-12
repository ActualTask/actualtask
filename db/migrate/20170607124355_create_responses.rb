class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|

      t.text :response
      t.boolean :accept
      #t.float :price
      t.timestamps
    end
  end
end
