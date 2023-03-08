class DropCreatorsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :creators
  end
end
