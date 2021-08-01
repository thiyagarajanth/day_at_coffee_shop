class Cart
	attr_accessor :items

	def initialize
		@items = []
	end

	def add_items(item)
		ordered_item = Shop::ITEMS[item.to_sym]
		if ordered_item && ordered_item[:availability] > 0
			items.append item
			ordered_item[:availability] = ordered_item[:availability]-1
		else
			return 'This item currently unavailable'
		end
		nil
	end
end