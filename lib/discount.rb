require_relative 'offer'

class Discount

  STRAWBERRY_DISCOUNT = 0.10
  COFFEE_DISCOUNT = 0.3333
  # thresholds
  MIN_ORDER_GR1 = 1
  MIN_ORDER_SR1 = 3
  MIN_ORDER_CF1 = 3
  # product codes
  GREEN_TEA = 'GR1'
  STRABERRIES = 'SR1'
  COFFEE = 'CF1'


  def initialize(offer = Offer.new)
    @offer = offer
  end


  def more_than_one?(order, product_code)
    @offer.select_all_alike(order, GREEN_TEA).count > MIN_ORDER_GR1
  end

  def apply_discounts(order)
    if more_than_one?(order, GREEN_TEA)
      @offer.buy_one_get_one_free(order)
    else
      order.reduce(0) { |sum, item| sum + item.price }
    end
  end

end
