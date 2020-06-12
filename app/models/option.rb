class Option < ApplicationRecord
  belongs_to :question, :inverse_of => :options
  accepts_nested_attributes_for :question

  has_many :answers, :inverse_of => :option
end
