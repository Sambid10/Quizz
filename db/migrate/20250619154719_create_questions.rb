class CreateQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :questions do |t|
      t.text :content
      t.string :answer1
      t.string :answer2
      t.string :answer3
      t.string :answer4
      t.integer :correct_answer
      t.references :category,null: false, foreign_key:true
      t.timestamps
    end
  end
end
