class Order < ActiveRecord::Base
	serialize :purchase_item

	def total_price
		line_items.to_a.sum { |product| product.total_price }
	end

    def total_quantity
		line_items.to_a.sum { |product| product.quantity }
	end
	
end
