class AddColumnsToMerchandiseReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :merchandise_reviews, :user_id, :integer
    add_column :merchandise_reviews, :merchandise_id, :integer
  end
end
