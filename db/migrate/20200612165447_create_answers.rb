class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.integer :user_id, index: true, foreign_key: true
      t.integer :assessment_id, index: true, foreign_key: true
      t.integer :question_id, index: true, foreign_key: true
      t.integer :option_id, index: true, unique: true, foreign_key: true

      t.timestamps
    end
  end
end
