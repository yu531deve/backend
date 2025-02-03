class AddFieldsToPosts < ActiveRecord::Migration[7.0]
  def change
    # ✅ is_favorite の追加を削除する
    # add_column :posts, :is_favorite, :boolean ← この行を削除する

    # ✅ カテゴリと給与のカラムを追加
    add_column :posts, :category, :string
    add_column :posts, :salary, :integer
  end
end
