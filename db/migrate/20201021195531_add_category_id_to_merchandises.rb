class AddCategoryIdToMerchandises < ActiveRecord::Migration[6.0]
  def change
    add_column :merchandises, :merchandise_category_id, :integer
  end
end
