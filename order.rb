class Order
	TAX = 8
	class << self
		def print_bill(items)
			order_amount = item_cost_by_group(items)
			order_list   = items.group_by(&:itself)
			discount 	   = get_discount_by_order(order_list)
			bill_amount  = order_amount - discount
			tax          = compute_tax(bill_amount).round(2)
			free_items   = free_item_by_order(order_list)
			total_items  = items.count

			puts '******************************************'
			puts 'Orderd items'
			puts '------------'
			order_list.each do |item, list|
				puts "#{item} count #{list.count}"
			end
			puts '-------------------------------'
			if free_items.any?
				free_items.each do |item|
					total_items += item[:count]
					puts "Free: #{item[:name]} count #{item[:count]}"
				end
			end

			puts "Total number of Items #{total_items}"
			puts "Bill amount: #{order_amount} "
			puts "- Discount: #{discount}"
			puts "Total before tax: #{bill_amount}"
			puts "Tax: #{tax}"
			puts "Total: #{bill_amount - tax}"
			puts '******************************************'
		end

		private

		def compute_tax(bill_amount)
			( bill_amount.to_f	/ 100 ) * TAX
		end

		def item_cost_by_group(items)
			items.map{|item| Shop.item_cost(item)}.sum
		end

		def get_discount_by_order(order_list)
			offer_list = order_list.map do |item, list| 
				offer = Offer.get_discount(item, list.count)
			end.compact.sum
		end

		def free_item_by_order(order_list)
			order_list.map do |item, list| 
				Offer.get_add_on(item, list.count)
			end.compact
		end
	end
end