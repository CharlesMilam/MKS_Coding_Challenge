require_relative "banking"

# Creating accounts
chase = Bank.new("JP Morgan Chase")
wells_fargo = Bank.new("Wells Fargo")
me = Person.new("Charles", 500)
friend1 = Person.new("Russ", 1000)
chase.open_account(me)
chase.open_account(friend1)
wells_fargo.open_account(me)
wells_fargo.open_account(friend1)

# Withdrawing and Depositing
chase.deposit(me, 200)
chase.deposit(friend1, 300)
chase.withdraw(me, 50)
wells_fargo.deposit(friend1, 100)
wells_fargo.withdraw(friend1, 20)

# transfers
chase.transfer(me, wells_fargo, 100)

# validate
chase.deposit(me, 5000)
chase.withdraw(me, 5000)

# count totals
puts chase.total_cash_in_bank
puts wells_fargo.total_cash_in_bank

# credit card
chase.create_card(me, card_params = ["Sapphire", 1000, 0.1])
puts chase.card(me,).balance.to_s
chase.card(me).charge(200)
puts chase.card(me).balance.to_s
chase.card(me).charge(801)
chase.card(me).payment(50)
puts chase.card(me).balance.to_s
chase.card(me).card_limit = 750
puts chase.card(me).card_limit.to_s
puts chase.card(me).balance.to_s
chase.card(me).interest
puts chase.card(me).balance.to_s
chase.card(me).payment(65)
puts chase.card(me).balance.to_s
chase.card(me).interest
puts chase.card(me).balance.to_s

chase.create_card(friend1, card_params = ["Sapphire", 1000, 0.1])
puts chase.card(friend1).balance.to_s
chase.card(friend1).charge(300)
puts chase.card(friend1).balance.to_s
chase.card(friend1).charge(701)
chase.card(friend1).payment(150)
puts chase.card(friend1).balance.to_s
chase.card(friend1).card_limit = 1500
puts chase.card(friend1).card_limit.to_s
puts chase.card(friend1).balance.to_s
chase.card(friend1).interest
puts chase.card(friend1).balance.to_s
chase.card(friend1).payment(50)
puts chase.card(friend1).balance.to_s
chase.card(friend1).interest
puts chase.card(friend1).balance.to_s
p chase.accts

wells_fargo.create_card(friend1, card_params = ["Mega Interest", 1500, 0.17])
wells_fargo.card(friend1).balance.to_s
wells_fargo.card(friend1).charge(333)
wells_fargo.card(friend1).balance.to_s
wells_fargo.card(friend1).interest
wells_fargo.card(friend1).balance.to_s
p wells_fargo.accts









