class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :product_id
      t.integer :customer_id
      t.string :customer_name
      t.string :address
      t.string :mobile_number
      t.integer :total_amount

      t.timestamps
    end
  end
end
