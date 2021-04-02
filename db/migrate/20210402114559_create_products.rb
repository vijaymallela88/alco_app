class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.integer :quantity
      t.integer :price
      t.integer :store_id

      t.timestamps
    end
  end
end
