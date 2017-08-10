class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :task_id
      t.integer :user_reviwed
      t.string :text

      t.timestamps
    end
  end
end
