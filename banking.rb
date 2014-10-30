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
		puts "Hi, #{@name}. You have $#{@cash_onhand}!"
	end

end

class Bank
# With the bank, you should be able to:
# open a new account using the person's name
# withdraw money from a person's account
# deposit money into a person's account
# transfer money to another bank

	attr_reader :bank_name
	attr_accessor :accts

	def initialize(new_name)
		@bank_name = new_name
		@accts = Array.new
		puts "#{@bank_name} was just created."
	end

	# creates new account
	def open_account(new_account)
		@accts.push({name: new_account.name, bal: 0})
		puts "#{new_account.name.capitalize}, thanks for opening an account at #{@bank_name}"
	end

	# deposits money into specified account, decrements person's cash on hand
	# for the deposited amount
	def deposit(account, deposit_amt)
		# get index for the account
		# TODO find better method of finding the correct account
		# is there a method getting the index in the array for
		# a given key in the hash
		@accts.each do |acct|
			if acct[:name] == account.name
				acct[:bal] += deposit_amt
				account.cash_onhand -= deposit_amt
				puts "#{account.name} deposited $#{deposit_amt} to #{@bank_name}. #{account.name} has $#{account.cash_onhand}. #{account.name}'s account has $#{acct[:bal]}."
			end
		end

		
	end

	# withdraws money from specified account, increments person's cash on hannd
	# for deposited amount
	def withdraw(account, withdraw_amt)
		
	end


end