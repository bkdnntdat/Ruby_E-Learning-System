class Word < ApplicationRecord
    belongs_to :category, class_name: Category.name, foreign_key: "category_id"
end
