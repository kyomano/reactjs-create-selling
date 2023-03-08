class CreateCreatorsTable < ActiveRecord::Migration[6.0]
  def change

      create_table :creators do |t|
        t.string :email
        t.string :username
        t.string :password_digest
        t.text :about
        t.integer :age
        t.string :location, optional: true
        t.string :promo_code, optional: true
        t.integer :promo_discount, default: 0
  
        t.timestamps
    end
  end
end
