class Question < ApplicationRecord
  has_many :options, dependent: :destroy, :inverse_of => :question
  accepts_nested_attributes_for :options

  has_many :answers, dependent: :destroy, :inverse_of => :question
  accepts_nested_attributes_for :answers

  belongs_to :assessment, optional: true
end
