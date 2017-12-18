class AddCategoryTranslitToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :category_translit, :string
  end
end
