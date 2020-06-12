class User < ApplicationRecord
  has_secure_password

  before_destroy { words.clear }

  has_and_belongs_to_many :words

  has_many :options, dependent: :destroy, :inverse_of => :user
  accepts_nested_attributes_for :options

  has_many :questions, dependent: :destroy, :inverse_of => :user
  accepts_nested_attributes_for :questions

  has_many :assessments, dependent: :destroy, :inverse_of => :user
  accepts_nested_attributes_for :assessments

  has_many :answers, dependent: :destroy, :inverse_of => :user
  accepts_nested_attributes_for :answers
end
