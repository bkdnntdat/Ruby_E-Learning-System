class CreateUsersWords < ActiveRecord::Migration[6.0]
  def change
    create_table :users_words do |t|
      t.integer :user_id, index: true, foreign_key: true
      t.integer :word_id, index: true, foreign_key: true
      t.boolean :learned, defaulf: false
      t.boolean :liked, defaulf: false

      t.timestamps
    end
  end
end