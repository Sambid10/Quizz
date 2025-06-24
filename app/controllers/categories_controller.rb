class CategoriesController < ApplicationController
  before_action :authenticate_admin!,
  def new
    @category = Category.new
  end

  def create
    @category = current_admin.categories.build(category_params)
    @category.questions.each do |question|
      question.admin_id=current_admin.id
    end
    if @category.save
      redirect_to @category, notice: "Category created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit_questions
  @category = Category.find(params[:id])
  @category.questions.build if @category.questions.empty?
end

def update_questions
  @category = Category.find(params[:id])

  # Assign incoming attributes WITHOUT saving yet
  @category.assign_attributes(category_params)

  # Assign current_admin.id to all questions missing admin_id (new questions)
  @category.questions.each do |question|
    question.admin_id ||= current_admin.id
  end

  if @category.save
    redirect_to  pages_admin_path, notice: "Questions updated successfully."
  else
    render :edit_questions, status: :unprocessable_entity
  end
end

  private
  def category_params
    params.require(:category).permit(
      :category_name,
      :category_description,
      :category_picurl,
      questions_attributes: [:content, :question_picurl,:answer1,:id, :answer2, :answer3, :answer4, :correct_answer , :_destroy]
    )
  end
end
