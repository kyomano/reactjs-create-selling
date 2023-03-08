class AddShippingAddressToSales < ActiveRecord::Migration[6.0]
  def change
    add_column :sales, :shipping_address, :string
  end
end
