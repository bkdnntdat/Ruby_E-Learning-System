class CreateUserWordRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :user_word_relationships, :id => false do |t|
      t.references :user, foreign_key: true, index: true
      t.references :word, foreign_key: true, index: true

      t.string :type

      t.timestamps
    end
    add_index :user_word_relationships, [:user_id, :word_id], unique: true
  end
end
