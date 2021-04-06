class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.integer :classification_id
      t.integer :genre_id
      t.integer :create_user_id
      t.string :name
      t.string :writer
      t.string :image_id
      t.boolean :edit_status, null: false, default: true
      t.boolean :is_active, null: false, default: true

      t.timestamps
    end
  end
end
