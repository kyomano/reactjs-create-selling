class CreateCreators < ActiveRecord::Migration[6.0]
  def change
    create_table :creators do |t|
      t.string :email
      t.string :username
      t.string :password_digest
      t.text :bio
      t.integer :age
      t.string :location
      t.string :promo_code
      t.integer :promo_discount

      t.timestamps
    end
  end
end
