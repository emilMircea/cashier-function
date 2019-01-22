require 'pry'

class Checkout
  attr_accessor :basket

  def initialize
    @basket = []
  end
end
