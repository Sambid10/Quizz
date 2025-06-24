class Category < ApplicationRecord
  belongs_to :admin
  has_many :questions
  accepts_nested_attributes_for :questions,allow_destroy: true
  has_one_attached :category_picurl
  validates :category_name, :category_picurl, presence:true
  
end
