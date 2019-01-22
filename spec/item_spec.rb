require 'item'

describe Item do
  context 'initialize' do
    let(:green_tea) { Item.new('Green tea', 3.11, 'GR1') }
    it 'should have a name' do
      expect(green_tea.name).to eq('Green tea')
    end
    it 'should have a price' do
      expect(green_tea.price).to eq(3.11)
    end
    it 'should have product code' do
      expect(green_tea.product_code).to eq('GR1')
    end
  end
end
