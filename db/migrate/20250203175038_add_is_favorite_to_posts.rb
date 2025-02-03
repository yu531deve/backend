class AddIsFavoriteToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :is_favorite, :boolean, default: false
  end
end
