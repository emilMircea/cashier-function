require 'pry'
require 'checkout'
require 'item'

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

  describe 'scan' do
    it 'adds items to the shopping cart' do
      @co.scan(gr1)
      @co.scan(sr1)
      @co.scan(cf1)
      expect(@co.basket).to eq([gr1, sr1, cf1])
    end
  end

  describe "total" do
    it 'should calculate price for one item in cart' do
      @co.scan(gr1)
      expect(@co.total).to eq(gr1.price)
    end

    it 'should calculate total price for many items in cart' do
      @co.scan(gr1)
      @co.scan(sr1)
      @co.scan(cf1)

      expect(@co.total)
        .to eq(
          gr1.price +
          sr1.price +
          cf1.price
        )
    end
  end

end
