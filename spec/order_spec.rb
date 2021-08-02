require_relative './../order'
require_relative './../cart'
require_relative './../offer'
require_relative './../shop'

describe Order do
	before do
		cart = Cart.new
		cart.add_items('coffee')
		cart.add_items('sandwich')
		cart.add_items('pizza')
		@bill_copy = Order.print_bill(cart.items)
	end

	context '#compute_tax' do
		
		it 'should user can add items in cart' do
			allow(Order).to receive(:compute_tax).and_return(:return_value)
			allow(Order).to receive(:item_cost_by_group).and_return(:return_value)
			allow(Order).to receive(:get_discount_by_order).and_return(:return_value)
			allow(Order).to receive(:free_item_by_order).and_return(:return_value)

			expect(@bill_copy).not_to be_nil
			expect(@bill_copy).to be_a(Float)
			expect(@bill_copy).not_to be_zero
		end
	end
end