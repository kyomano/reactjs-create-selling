class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.string :promo_code
      t.float :tip

      t.timestamps
    end
  end
end
