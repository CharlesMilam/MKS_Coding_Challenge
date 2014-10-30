# Simulates a simple banking environment

# Can support multiple banks, and multiple users

# Contains two classes:

# Person class 
# A new person should have a name set and should have a certain 
# amount of cash that the person keeps with him/her.

# Bank class 
# With the bank, you should be able to: 
# open a new account using the person's name withdraw money from a person's account 
# deposit money into a person's account 
# transfer money to another bank

# Milam 103014

class Person
# A new person should have a name set and should have a 
# certain amount of cash that the person keeps with him/her.

	attr_reader :name
	attr_accessor :cash_onhand

	def initialize(new_name, starting_cash)
		@name = new_name
		@cash_onhand = starting_cash
		puts "Hi, #{@name}, you have $#{@cash_onhand}."
	end

end

class Bank
# With the bank, you should be able to:
# open a new account using the person's name
# withdraw money from a person's account
# deposit money into a person's account
# transfer money to another bank

	attr_reader :bank_name

	def initialize(new_name)
		@bank_name = new_name
		puts "#{@bank_name} was just created."
	end

end