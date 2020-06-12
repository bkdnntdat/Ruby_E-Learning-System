class Assessment < ApplicationRecord
  has_many :answers, dependent: :destroy, :inverse_of => :assessment
  accepts_nested_attributes_for :answers

  has_many :questions
end