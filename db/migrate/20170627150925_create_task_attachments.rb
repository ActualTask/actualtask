class CreateTaskAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :task_attachments do |t|
      t.integer :task_id


    end
  end
end
