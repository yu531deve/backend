class AddCategoryAndSalaryToPosts < ActiveRecord::Migration[7.0]
  def change
    # ✅ category の追加を削除する
    # add_column :posts, :category, :string ← この行を削除

    # ✅ salary のカラムを追加 (salary もすでにある場合は削除)
    add_column :posts, :salary, :integer unless column_exists?(:posts, :salary)
  end
end
