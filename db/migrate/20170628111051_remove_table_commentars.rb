class RemoveTableCommentars < ActiveRecord::Migration[5.1]
  def change
    drop_table :commentars
  end
end
