require 'pry'
require_relative 'discounts'

class Checkout
  attr_accessor :basket

  def initialize(discounts = Discounts.new)
    @discounts = discounts
    @basket = []
  end

  def scan(item)
    @basket << item
  end

  def total
    total = @basket.reduce(0) { |sum, item| sum + item.price }
  end
end
