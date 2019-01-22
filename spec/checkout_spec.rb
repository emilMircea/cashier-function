require 'pry'

describe Checkout do
  before do
    # initialize
    @co = Checkout.new
  end

  # items
  let(:gr1) { Item.new('Green tea', 3.11, 'GR1') }
  let(:sr1) { Item.new('Strawberries', 5.00, 'SR1') }
  let(:cf1) { Item.new('Coffee', 11.23, 'CF1') }

  describe 'initialise' do
    it 'starts with an empty basket' do
      expect(@co.basket).to eq([])
    end
  end

end
