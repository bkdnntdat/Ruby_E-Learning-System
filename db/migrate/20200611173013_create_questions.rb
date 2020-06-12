class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions, force: :cascade do |t|
      t.string :question
      t.boolean :justOneCorrectOption, defaulf: false
      t.integer :category_id, index: true

      t.timestamps
    end
  end
end
