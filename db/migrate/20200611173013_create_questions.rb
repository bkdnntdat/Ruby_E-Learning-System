class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions, force: :cascade do |t|
      t.string :question
      t.boolean :justOneCorrectOption

      t.timestamps
    end
  end
end
