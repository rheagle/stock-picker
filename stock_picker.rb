# ruby stock_picker.rb

def stock_picker(prices)
  result = {}
  prices.each_with_index do |price, i|
    # calc differences with subsequent numbers in array
    differences = prices[i+1..-1].map { |next_price| next_price - price }
    result[price] = differences unless differences.empty?
  end


  max_key = nil
  max_value = nil

  # find max difference value and its respective key
  result.each do |key, values|
    current_max = values.max
    if max_value.nil? || current_max > max_value
      max_value = current_max
      max_key = key
    end
  end
  
  # return nil if no profit can be made
  if max_value.nil? || max_value <= 0
    final_answer = nil
  else
    # find index of best day to buy in original array
    buy_day = prices.index(max_key)
    # find sell price that creates max_value
    sell_price = max_key + max_value
    # find index of best day to sell in original array
    sell_day = prices.index(sell_price)
    # return final buy/sell days in an array
    final_answer = [buy_day, sell_day]
  end

  p final_answer

end

stock_picker([15, 1, 20, 10, 25, 5, 30])

