require 'pry'
require_relative 'discount'
require_relative 'item'

class Checkout
  attr_accessor :basket

  def initialize(discount = Discount.new)
    @discount = discount
    @basket = []
  end

  def scan(item)
    @basket << item
  end

  def total
    @discount.apply_discounts(@basket)
  end
end
