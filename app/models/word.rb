class Word < ApplicationRecord
    has_and_belongs_to_many :users

    belongs_to :category, class_name: Category.name, foreign_key: "category_id"
end
