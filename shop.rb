	class Shop
		ITEMS = {
			beverage: { cost: 70, availability: 10 },
			sandwich: { cost: 50, availability: 30 },
			coffee: { cost: 5, availability: 20 },
			pizza: { cost: 30, availability:2 }
		}

		def self.item_cost(item)
			ITEMS[item.to_sym][:cost]
		end

		def self.get_items
			puts 'Item\'s list'
			puts '-------------'
			ITEMS.each do |k, v|
				puts "Name: #{k}, Cost: #{v[:cost]}, Availability: #{v[:availability]}"
			end
		end

	end