describe Discount do
  let(:co) { Checkout.new }
  let(:offer) { Offer.new }
  let(:discount) { Discount.new }
  let(:green_tea) { Item.new('Green tea', 3.11, 'GR1') }
  let(:coffee) { Item.new('Coffee', 11.23, 'CF1') }
  let(:strawberries) { Item.new('Strawberries', 5.0, 'SR1') }

  it 'should apply the buy_one_get_one_free offer' do
    2.times { co.scan(green_tea) }
    expect(discount.more_than_one?(co.basket, green_tea.product_code)).to be true
    expect(co.total).to be 3.11
  end

  it 'should apply the three_or_more offer for strawberries' do
    3.times { co.scan(strawberries) }
    co.scan(green_tea)
    expect(discount.more_or_equal_strawberries?(co.basket, strawberries.product_code)).to be true
    expect(co.total).to be 16.61
  end

  it 'should apply the three_or_more offer for coffee' do
    3.times { co.scan(coffee) }
    co.scan(strawberries)
    expect(discount.more_or_equal_coffee?(co.basket, coffee.product_code)).to be true
    expect(co.total).to be 27.46
  end
end
