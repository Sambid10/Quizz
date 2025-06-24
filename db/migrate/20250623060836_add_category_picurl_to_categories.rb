class AddCategoryPicurlToCategories < ActiveRecord::Migration[8.0]
  def change
    add_column :categories, :category_picurl, :string
  end
end
