require 'csv'

CSV.read('db/haiku.csv').each do |haiku|
  Haiku.create( :line_1 => haiku[0],
                :line_2 => haiku[1],
                :line_3 => haiku[2])
end