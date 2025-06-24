class RemoveQuestionPicurlFromQuestions < ActiveRecord::Migration[8.0]
  def change
    remove_column :questions, :question_picurl, :string
  end
end
