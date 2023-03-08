class AddForeignKeysToSales < ActiveRecord::Migration[6.0]
  def change
    add_column :sales, :user_id, :integer
    add_column :sales, :merchandise_id, :integer
  end
end
