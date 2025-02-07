class RenameBodyToDescription < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :body, :description
  end
end
