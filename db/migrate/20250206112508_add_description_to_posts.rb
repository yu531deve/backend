class AddDescriptionToPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :description, :text
  end
end
