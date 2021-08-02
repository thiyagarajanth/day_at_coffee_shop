require_relative './../shop'

describe Shop do

	it 'should retrun item price' do
		expect(Shop.item_cost('beverage')).not_to be_nil
	end

	it 'should retrun items list' do
		item_list = Shop.get_items
		expect(item_list).to be_a(Hash)
		expect(item_list.count).not_to be_zero
	end

end