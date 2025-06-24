class Public::CategoriesController < ApplicationController
  before_action :authenticate_user!

  def answer
    @category = Category.find(params[:id])
    @questions = @category.questions
  end

  def submit_answers
    @category = Category.find(params[:id])
    @questions = @category.questions
    @errors = []

    params[:answers]&.each do |question_id, selected_answer|
      question = @questions.find(question_id)
      answers = [question.answer1, question.answer2, question.answer3, question.answer4]
      correct_answer = answers[question.correct_answer - 1]

      UserAnswer.create!(
        user_id: current_user.id,
        question_id: question.id,
        answer_id: answers.index(selected_answer) + 1,
        answered_at: Time.current
      )

      if selected_answer != correct_answer
        @errors << { question: question, correct_answer: correct_answer,selected_answer: selected_answer }
      end
    end

    if @errors.any?
      flash.now[:alert] = "Some answers were incorrect. Please review."
      render :answer, status: :unprocessable_entity
    else
      flash.now[:success] = "Congratulations!! All answers were correct 🎉🎉🎉🎉"
      render :answer, status: :unprocessable_entity
    end
  end
end
