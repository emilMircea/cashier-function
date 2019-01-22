class Offer

  def total_before_discount(order)
    order.reduce(0) { |sum, item| sum + item.price }
  end

  def select_all_alike(order, pr_code)
    order.select { |item| item.product_code == pr_code }
  end

  def round_decimals(total)
    total.round(2)
  end

  def buy_one_get_one_free(order)
    total = total_before_discount(order)
    green_teas = select_all_alike(order, 'GR1')
    round_decimals(total - green_teas.count / 2 * green_teas[0].price)
  end

end
