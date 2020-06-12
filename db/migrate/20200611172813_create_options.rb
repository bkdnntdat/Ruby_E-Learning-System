class CreateOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :options, force: :cascade do |t|
      t.string :content
      t.boolean :isTrue, defaulf: false
      t.integer :question_id, index: true, unique: true

      t.timestamps
    end

    # add_index :options, [:question_id, :option_id], unique: true
  end
end
