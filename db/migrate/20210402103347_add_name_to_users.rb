class AddNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :age, :integer
    add_column :users, :address, :string
    add_column :users, :mobile_number, :string
    add_column :users, :user_type, :string
  end
end
