stock_prices = [13,3,6,8,15,8,6,1,10]


buy_me = { :buy_day => nil,
           :buy_price => nil,
           :sell_day => nil, 
           :sell_price => nil,
           :profit => 0 }

puts '*' * 50
puts stock_prices.to_s
puts '*' * 50


stock_prices.sort.each_with_index do |p_price, p_i|

  p_day = stock_prices.index(p_price)
  counter = stock_prices.length - 1

  counter.downto(p_i + 1) do |s_i|
    puts "comparing position #{p_i} to #{s_i}"
    s_price = stock_prices[s_i]
    s_day = stock_prices.index(s_price)
    profit = s_price - p_price

    if p_day < s_day and profit > buy_me[:profit]
      buy_me[:buy_day] = p_day
      buy_me[:buy_price] = p_price
      buy_me[:sell_day] = s_day
      buy_me[:sell_price] = s_price
      buy_me[:profit] = profit
    else
      next
    end
  end
end

pp buy_me
