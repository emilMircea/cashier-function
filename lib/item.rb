class Item
  attr_reader :name, :price, :product_code
  
  def initialize(name, price, product_code)
    @name = name
    @price = price
    @product_code = product_code
  end
end
