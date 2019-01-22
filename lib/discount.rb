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
  STRAWBERRIES = 'SR1'
  COFFEE = 'CF1'

  def initialize(offer = Offer.new)
    @offer = offer
  end

  def more_than_one?(order, product_code)
    @offer.select_all_alike(order, product_code).count > MIN_ORDER_GR1
  end

  def more_or_equal_strawberries?(order, product_code)
    @offer.select_all_alike(order, product_code).count >= MIN_ORDER_SR1
  end

  def more_or_equal_coffee?(order, product_code)
    @offer.select_all_alike(order, product_code).count >= MIN_ORDER_CF1
  end

  def apply_discounts(order)
    if more_than_one?(order, GREEN_TEA)
      @offer.buy_one_get_one_free(order, GREEN_TEA)
    elsif more_or_equal_strawberries?(order, STRAWBERRIES)
      @offer.reduce_price_by(order, STRAWBERRIES, STRAWBERRY_DISCOUNT)
    elsif more_or_equal_coffee?(order, COFFEE)
      @offer.reduce_price_by(order, COFFEE, COFFEE_DISCOUNT)
    else
      order.reduce(0) { |sum, item| sum + item.price }
    end
  end

end
