require_relative './../offer'

describe Offer do

	context '#get_discount' do
		let(:beverage) { Offer.get_discount('beverage', 5) }
		let(:sandwich_with_offer) { Offer.get_discount('sandwich', 5) }
		let(:sandwich_without_offer) { Offer.get_discount('sandwich', 2) }
		
		it 'should retrun discount price' do
			expect(beverage).to be_nil
			expect(sandwich_without_offer).to be_nil
			expect(sandwich_with_offer).not_to be_nil
			expect(sandwich_with_offer).to be_a(Float)
			expect(sandwich_with_offer).not_to be_zero
		end
	end

	context '#get_add_on' do
		let(:pizza) { Offer.get_add_on('pizza', 3) }
		let(:coffee) { Offer.get_add_on('coffee', 3) }
		
		it 'should retrun free item for given order' do
			expect(pizza).to be_nil
			expect(coffee).not_to be_nil
			expect(coffee).to be_a(Hash)
			expect(coffee[:count]).not_to be_zero
		end
	end

end