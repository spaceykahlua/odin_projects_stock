#!/usr/bin/env ruby

def stock_picker (stock_prices=[])
  buy_me = { :buy_day => nil, :buy_price => nil, :sell_day => nil, :sell_price => nil, :profit => 0 }


  stock_prices.each_with_index do |p_price, p_day|

    counter = stock_prices.length - 1
    counter.downto(p_day + 1) do |s_day|
      s_price = stock_prices[s_day]
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

  puts
  puts '*' * 50
  puts 'Crystal Ball: ' + stock_prices.to_s
  puts '*' * 50
  puts "What to do:"
  pp buy_me
end

a = [17,3,6,9,15,8,6,1,10]
b = [99,3,6,9,15,8,6,18,10,0.5]
c = [99,3,0.5,9,15,8,6,18,87]



stock_picker(a)
stock_picker(b)
stock_picker(c)

