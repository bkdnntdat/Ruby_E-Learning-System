class CreateOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :options, force: :cascade do |t|
      t.string :content
      t.boolean :isTrue
      t.integer :question_id

      t.timestamps
    end

    add_index :options, [:option_id, :question_id], unique: true
  end
end
