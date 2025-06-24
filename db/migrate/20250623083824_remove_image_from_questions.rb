class RemoveImageFromQuestions < ActiveRecord::Migration[8.0]
  def change
    remove_column :questions, :image, :string
  end
end
