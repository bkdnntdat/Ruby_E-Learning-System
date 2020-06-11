class CreateAssessments < ActiveRecord::Migration[6.0]
  def change
    create_table :assessments, force: :cascade do |t|
      t.time :timeLimit
      t.integer :categoty_id

      t.timestamps
    end
  end
end
