class RemoveIsActiveFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :is_active, :boolean
  end
end
