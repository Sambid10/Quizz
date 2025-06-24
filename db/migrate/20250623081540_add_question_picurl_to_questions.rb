class AddQuestionPicurlToQuestions < ActiveRecord::Migration[8.0]
  def change
    add_column :questions, :question_picurl, :string
  end
end
