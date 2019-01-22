require 'pry'
require_relative 'discounts'

class Checkout
  attr_accessor :basket

  def initialize(discounts = Discounts.new)
    @discounts = discounts
    @basket = []
  end
end
