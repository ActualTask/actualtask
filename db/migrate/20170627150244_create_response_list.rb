class CreateResponseList < ActiveRecord::Migration[5.1]
  def change
    create_table :response_lists do |t|
      t.integer :task_id
      t.integer :performer_id
      t.text :response_text
      t.string :response_status
    end
  end
end
