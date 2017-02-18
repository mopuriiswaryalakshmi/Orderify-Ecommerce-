class LineItem < ActiveRecord::Base
	belongs_to :product
	belongs_to :user


before_save :products_total

def products_total
    
	self.total = self.price * self.quantity
	

end


end
