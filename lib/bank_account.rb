require 'pry'
class BankAccount
  attr_accessor :status, :balance
  attr_reader :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    @@all << self
  end
  
  
  def deposit(deposit_amount)
     @balance += deposit_amount.to_i
  end
  
  def display_balance
    "Your balance is $#{@balance}."
  end
  
  def valid?
    @status=="open" && @balance > 0
  end
    
  def close_account
    @status = "closed"
  end
  
  def self.all
    @@all
  end
end
