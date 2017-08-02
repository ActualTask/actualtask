class CreateTableReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :task_id
      t.integer :user_id
      t.integer :user_reviewed
      t.text :text
      t.integer :rating

    end
  end
end
