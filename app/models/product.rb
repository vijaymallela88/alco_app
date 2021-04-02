class Product < ApplicationRecord
	belongs_to :store
	has_many :carts
	has_many :orders
end
