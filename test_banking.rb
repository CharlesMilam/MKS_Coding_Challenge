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





