class RemoveEditStatusFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :edit_status, :boolean
    remove_column :books, :is_active, :boolean
  end
end
