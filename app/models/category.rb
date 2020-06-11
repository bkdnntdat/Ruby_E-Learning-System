class Category < ApplicationRecord
    has_many :words, class_name: Word.name, foreign_key: "category_id"
end
