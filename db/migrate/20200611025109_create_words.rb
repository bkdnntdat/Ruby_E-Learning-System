class CreateWords < ActiveRecord::Migration[6.0]
  def change
    create_table :words do |t|
      t.string :word
      t.string :mean
      t.string :diction
      t.integer :category_id
      t.string :image_link

      t.timestamps
    end
  end
end
