load 'shop.rb'
class Offer
	DISCOUNT = {
		sandwich: {
			quantity: 3,
			discount_type: 'percent',
			value: 5
		},
		pizza: {
			quantity: 2,
			discount_type: 'cash',
			value: 5
		}
		
	}

	ADDON = {
		coffee: {
			quantity: 2,
			discount_type: 'free',
			value: 1
		}
	}

	def self.get_discount(item, count)
		discount_item = DISCOUNT[item.to_sym]
		return unless discount_item
		if discount_item[:quantity] <= count
			discount = count / discount_item[:quantity]
			if discount_item[:discount_type] == 'cash'
				discount_item[:value]*discount
			elsif discount_item[:discount_type] == 'percent'
				get_percentage_value(item)
				price_per_item = Shop.item_cost(item)
				bill = price_per_item * (discount_item[:quantity] * discount)
				bill - ((bill - discount_item[:value]).to_f / 100).round(2)
			end
		end
	end

	def self.get_add_on(item, count)
		free_item = ADDON[item.to_sym]
		if free_item && free_item[:quantity] <= count
			free_count = count / free_item[:quantity]
			{ name: item, count: free_count }
		end
	end
end