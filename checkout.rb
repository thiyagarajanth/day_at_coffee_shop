load 'shop.rb'
load 'cart.rb'
load 'order.rb'
load 'offer.rb'

	Shop.get_items
	cart = Cart.new
	puts "Please enter the item or Enter 'x' to exit"
	while item = gets.chomp
		break if item.casecmp('x') == 0
		puts cart.add_items(item)
	end
	Order.print_bill(cart.items)

