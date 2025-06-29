class CreateCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :categories do |t|
      t.string :category_name
      t.string :category_description,null: true
      t.references :admin,null: false, foreign_key: true
      t.timestamps
    end
  end
end
