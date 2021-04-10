class AddStatusToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :edit_status, :boolean, default: true
    add_column :books, :is_active, :boolean, default: true
  end
end
