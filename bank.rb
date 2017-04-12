#create a class to structure our account information
class Account
	attr_accessor :name, :acct_num, :balance 

	def initialize(name, acct_num, balance)
		@name = name
		@acct_num = acct_num
		@balance = balance
	end
	

	def deposit(amount)
		@balance += amount
	end	

	def withdrawal(amount)
		@balance -= amount
	end

end



def main_menu(number_of_account, accounts) 
	puts "Welcome to Creighton Bank." 
	puts "Please choose from below:"
	puts "--------------------------"
	puts "1. Create an account"
	puts "2. View an existing acount"
	puts "3. Exit System  "

	choice = gets.chomp.to_i

	case choice
		when 1
			create_account(number_of_account, accounts)
		when 2
			accounts_menu(number_of_account, accounts)
		when 3 
			puts "Thank you for banking with us!"
			exit
		else
			puts "Invalid entry. Please try again."
			main_menu(number_of_account, accounts)
	end					


end

number_of_account = 0 #keep track of the number of accounts in the accounts array.
accounts = [] #will hold all our accounts

def create_account(number_of_account, accounts)

	new_account = [] #This array will hold the data for our new account 
	puts "Welcome to Creighton Bank.  Let's create your account:"

	puts "Enter your name:"
	name = gets.chomp.capitalize
	puts "Enter your starting balance:"
	balance = gets.chomp.to_f

	#we create an account number based on the number of elements in our account array
	#to prevent having account number 0, we increment account_number by 1. Each
	#new account will have an account number that is 1 number larger than the
	#last account created.
	account_number = number_of_account +=1 
	new_account = Account.new(name, account_number, balance)
	accounts.push(new_account)
 


	puts "Your account has been created!"
	puts "Account Name: #{new_account.name}"
	puts "Account Number: #{new_account.acct_num}"
	puts "Account Balance: $#{new_account.
	balance}"


	#This is just a test to make sure the data is making it to our accounts array
	# accounts.each do |account|
	# 	puts "Account Name: #{account.name}"
	# 	puts "Account Number: #{account.acct_num}"
	# 	puts "Account Balance: $#{account.balance}"
	# end	

	main_menu(number_of_account, accounts)
end	

def accounts_menu(number_of_account, accounts)
	puts "Please enter your account_number:"
	account_number = gets.chomp.to_i
	puts "Please enter your name:"
	account_name = gets.chomp.capitalize
	account_balance = 0 #initializes the variable that will hold our account balance from the array
	
	check = false #initializes the variable that will tell us if the account is found.

	accounts.each do |account|

		if account.name == account_name && account.acct_num = account_number
			account_balance = account.balance
			check = true #if the account is found our check is set to true and the user can enter the account menu
			
		end
	end		


		if check == false
			puts "Sorry, that account is not found.  Please contact customer service or create an account."	
			main_menu(number_of_account, accounts)

		else	

			puts "Welcome to the Accounts Menu."
			puts " Choose from below:"
			puts "------------------------------"
			puts "1. View Balance"
			puts "2. Make a deposit"
			puts "3. Make a withdrawal"
			puts "4. Exit to main menu"

			choice = gets.chomp.to_i


			case choice
			when 1
				puts "Your balance is $#{account_balance}"
				accounts_menu(number_of_account, accounts)
			when 2

				puts "How much would you like to deposit?"
				amount = gets.chomp.to_f
				
				accounts.each do |account|
					if account_name == account.name && account_number == account.acct_num
						account.deposit(amount)
						puts "Your new balance is #{account.balance}"
						accounts_menu(number_of_account, accounts)
					end
				end
			
			when 3
				
				puts "How much would you like to withdraw?"
				amount = gets.chomp.to_f
				
				accounts.each do |account|
					if account_name == account.name && account_number == account.acct_num
							if account.balance > amount
								account.withdrawal(amount)
								puts "Your new balance is #{account.balance}"
								accounts_menu(number_of_account, accounts)

							else
							 	puts "You have insufficient funds.  Please withdraw a smaller amount."
							 	accounts_menu(number_of_acount, accounts)
							end 		
					end
				end
			when 4
				main_menu(number_of_account, accounts)			
			end	
		end	

	end

system("clear")	#clears the terminal  - would be system("cls") for windows.

main_menu(number_of_account, accounts)
