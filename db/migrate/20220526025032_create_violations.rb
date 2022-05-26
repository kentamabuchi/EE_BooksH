class CreateViolations < ActiveRecord::Migration[5.2]
  def change
    create_table :violations do |t|
      t.text :comment
      t.boolean :is_active, default: true
      t.integer :book_id
      t.integer :user_id

      t.timestamps
    end
  end
end
