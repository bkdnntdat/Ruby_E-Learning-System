class CreateUserWordRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :user_word_relationships do |t|
      t.integer :user_id
      t.integer :word_id
      t.string :type

      t.timestamps
    end
  end
end
