class CreateMerchandises < ActiveRecord::Migration[6.0]
  def change
    create_table :merchandises do |t|
      t.string :title
      t.text :description
      t.float :price

      
      t.timestamps
    end
  end
end
