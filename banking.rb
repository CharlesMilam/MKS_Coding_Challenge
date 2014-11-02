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
		# is there a method for getting the index in the array for
		# a given key in the hash, rather than looping through the
		# entire array
		@accts.each do |acct|
			if acct[:name] == account.name
				if deposit_amt < account.cash_onhand
					acct[:bal] += deposit_amt
					account.cash_onhand -= deposit_amt
					puts "#{account.name} deposited $#{deposit_amt} to #{@bank_name}. #{account.name} has $#{account.cash_onhand}. #{account.name}'s account has $#{acct[:bal]}."
				else
					puts "#{account.name} does not have enough cash to deposit $#{deposit_amt}."
				end
			end
		end


	end

	# withdraws money from specified account, increments person's cash on hannd
	# for deposited amount
	def withdraw(account, withdraw_amt)
		# similar TODO as for deposit e.g. better method for locating the correct
		# account, other than by looping through all of them
		@accts.each do |acct|
			if acct[:name] == account.name
				if acct[:bal] > withdraw_amt
					acct[:bal] -= withdraw_amt
					account.cash_onhand += withdraw_amt
					puts "#{account.name} withdrew $#{withdraw_amt} from #{@bank_name}. #{account.name} has $#{account.cash_onhand}. #{account.name}'s account has $#{acct[:bal]}."
				else
					puts "#{account.name} does not have enough money in the account to withdraw $#{withdraw_amt}."
				end
			end
		end
	end

	# transfers money from bank of specified account to account of provided bank
	# decrements and increments the appropriate accounts
	def transfer(account, transfer_bank, transfer_amt)
		# See comments for deposit and withdraw about utilizing a better method of
		# finding accounts. Yeah, I know, but there has to be a better way.
		@accts.each do |acct_from|
			if acct_from[:name] == account.name
				transfer_bank.accts.each do |acct_to|
					if acct_to[:name] == account.name
						acct_from[:bal] -= transfer_amt
						acct_to[:bal] += transfer_amt
						puts "#{account.name} transfered $#{transfer_amt} from the #{@bank_name} account to the #{transfer_bank.bank_name} account. The #{transfer_bank.bank_name} account has $#{acct_to[:bal]} and the #{@bank_name} account has $#{acct_from[:bal]}."
					end
				end
			end
		end
	end

	# sums the balances for all accounts in a given bank
	def total_cash_in_bank
		# seems to be a good place for a recursive call
		# something like a fold method, but not sure how
		# to implement.

		total_cash = 0
		@accts.each {|acct|  total_cash += acct[:bal]}

		return "#{@bank_name} has $#{total_cash} in the bank."
	end

	# create a new credit for an account, with supplied
	# card name, card type (credit|debit), credit limit,
	# and interest rate
	def create_card(account, card_params)
		@accts.each do |acct|
			if acct[:name] == account.name
				card = (acct[:card] = Credit_Card.new(card_params))
				puts "New #{card.card_name} #{card.card_type} card created for #{account.name}, with a credit limit of $#{card.card_limit.to_s} and an interest rate of #{card.interest_rate.to_s}%."
			end
		end
	end

	# returns a card for a given account
	def card(account)
		@accts.each do |acct|
			if acct[:name] == account.name
				return acct[:card]
			end
		end
	end

end

class Credit_Card
	# a credit card for a particular account within a bank.
	# will create a new card, set a credit limit, card type
	# and interest rate for the card. Will accept charges and payments
	# and apply interest to the card balance.

	attr_reader :card_name, :card_type
	attr_accessor :card_limit, :interest_rate, :balance

	def initialize(card_params)
		@card_name = card_params[0]
		@card_type = card_params[1]
		@card_limit = card_params[2]
		@interest_rate = card_params[3]
		@balance = 0
	end

	# applies charge to card if it does not exceed credit limit
	def charge(charge_amt)
		if (@balance + charge_amt) < @card_limit
			@balance += charge_amt
			puts "Success. Transaction approved."
		else
			puts "Declined. Transaction would exceed credit limit."
		end
	end

	# applies payment to card balance
	def payment(payment_amt)
		@balance -= payment_amt
		puts "$#{payment_amt} applied to account balance."
	end

	# applies interest rate to card balance
	def interest
		@balance += @balance * @interest_rate
		puts "Success. Interest rate applied to balance."
	end
end