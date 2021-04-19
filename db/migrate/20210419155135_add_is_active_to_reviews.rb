class AddIsActiveToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :is_active, :boolean, default: true
  end
end
