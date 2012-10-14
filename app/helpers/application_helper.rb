module ApplicationHelper

  def variations_prices(prices)
    prices.sample(3).collect { |price| number_to_currency(price, precision: 0) }.join(', ')
  end

end
