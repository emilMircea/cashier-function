describe Discount do
  let(:co) { Checkout.new }
  let(:green_tea) { Item.new('Green tea', 3.11, 'GR1') }
  let(:strawberries) { Item.new('Strawberries', 5.0, 'SR1') }

  it 'should know when to apply the discount' do
    2.times { co.scan(green_tea) }
    expect(co.total).to eq(3.11)
  end

  it 'should know when NOT to apply the discount' do
    2.times { co.scan(strawberries) }
    expect(co.total).not_to eq(5.0)
    expect(co.total).to eq(10)
  end
end
