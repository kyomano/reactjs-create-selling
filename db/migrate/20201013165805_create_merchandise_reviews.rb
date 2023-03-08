class CreateMerchandiseReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :merchandise_reviews do |t|
      t.string :title
      t.text :body
      t.integer :rating

      t.timestamps
    end
  end
end
