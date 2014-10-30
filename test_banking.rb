require_relative "banking"

# test creation of instances of classes Person and Bank
charles = Person.new("Charles", 300)
grace = Person.new("Grace", 500)
alli = Person.new("Alli", 750)
bank_local = Bank.new("Milam Local Trust")
bank_big = Bank.new("Too Big To Fail")


# test retrieving Person name and cash on hand
puts "#{charles.name} has $#{charles.cash_onhand} on hand."
puts "#{grace.name} has $#{grace.cash_onhand} on hand."
puts "#{alli.name} has $#{alli.cash_onhand} on hand."

# test retrieving bank name
puts "The Milams' favorite bank is #{bank_local.bank_name}."
puts "The Milams are leery of #{bank_big.bank_name}."


