class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.text :about
      t.string :password_digest
      t.integer :age
      t.string :email

      t.timestamps
    end
  end
end
