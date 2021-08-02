require_relative './../cart'
require_relative './../shop'

describe Cart do

	context '#add_items' do
		let(:cart) { Cart.new }
		it 'should user can add items in cart' do

			expect(cart.add_items('coffee')).to eq('Item Added in cart')
			expect(cart.add_items('meals')).to eq('This item currently unavailable')
		end
	end

end
