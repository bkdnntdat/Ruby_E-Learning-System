class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :assessment_id
      t.integer :question_id
      t.integer :choosedOption_id

      t.timestamps
    end

    add_index :answers, [:user_id, :answers_id]
    add_index :answers, [:assessment_id, :answers_id]
    add_index :answers, [:question_id, :answers_id]
    add_index :answers, [:choosedOption_id, :answers_id], unique: true
  end
end
