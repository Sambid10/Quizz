class Question < ApplicationRecord
  belongs_to :category
  belongs_to :admin 
  has_one_attached :question_picurl
end
