=begin
Coin sums Problem 31
In the United Kingdom the currency is made up of pound (£) and pence (p). 
There are eight coins in general circulation:
  1p, 2p, 5p, 10p, 20p, 50p, £1 (100p), and £2 (200p).
It is possible to make £2 in the following way:
  1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
How many different ways can £2 be made using any number of coins?
=end
=begin
  L2 = 200p
     = L1 + 100p
     = L1 +  50p + 2x20p +   10p
     = L1 +        5x20p
     = L1 +        4x20p + 2x10p
	 = L1 +        3x20p + 4x10p
	 = L1 +        2x20p + 6x10p
	 = L1 +        1x20p + 8x10p   
=end
target = 200
coins = [1, 2, 5, 10, 20, 50, 100, 200]

ways = [0] * (target + 1)
ways[0] = 1
coins.each do |coin|
  coin.upto(target) do |n|
    ways[n] += ways[n - coin]
  end
end

puts ways[target]
