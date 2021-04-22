class FavoriteUser < ActiveRecord::Migration[5.2]
  def change
    drop_table :favorite_users
  end
end
