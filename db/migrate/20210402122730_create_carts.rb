class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.integer :product_id
      t.integer :customer_id
      t.boolean :status

      t.timestamps
    end
  end
end
