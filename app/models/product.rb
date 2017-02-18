class Product < ActiveRecord::Base
	has_many :line_items
	has_many :orders
	has_many :recent_views
	belongs_to :category
	has_many :whish_lists

	
	belongs_to :category
     belongs_to :subcategory
end



