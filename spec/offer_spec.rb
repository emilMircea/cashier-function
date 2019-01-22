require 'offer'
require 'item'
require 'checkout'

describe Offer do
  let(:co) { Checkout.new }
  let(:offer) { Offer.new }
  let(:coffee) { Item.new('Coffee', 11.23, 'CF1') }
  let(:strawberries) { Item.new('Straweberries', 5.00, 'SR1') }
  let(:green_tea) { Item.new('Green tea', 3.11, 'GR1') }


  it 'should know when to apply the discount' do
    2.times { co.scan(green_tea) }
    expect(co.total).to eq(3.11)
  end

  it 'should know when NOT to apply the discount' do
    2.times { co.scan(strawberries) }
    expect(co.total).not_to eq(5.0)
    expect(co.total).to eq(10)
  end

  # THESE TESTS SHOULD MOVE TO DISCOUNT_SPEC

  it 'should apply the offer when conditions are met' do
    expect(coffee.price).to eql(11.23)
    3.times { co.scan(coffee) }
    co.scan(green_tea)
    co.scan(strawberries)
    expect(co.total).to eql(30.57)
  end

  it 'should not apply the offer if conditions are not met' do
    expect(coffee.price).to eql(11.23)
    2.times { co.scan(coffee) }
    expect(co.total).to eql(22.46)
  end

end
