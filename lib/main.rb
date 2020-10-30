require 'pry'
require_relative 'bank_account.rb'
require_relative 'transfer.rb'




bank1 = BankAccount.new("Nick")
bank2 = BankAccount.new("Melissa")
transfer1 = Transfer.new(bank1,bank2,50)
transfer1.valid?
transfer1.execute_transaction
binding.pry
transfer1.execute_transaction
binding.pry
puts "test"