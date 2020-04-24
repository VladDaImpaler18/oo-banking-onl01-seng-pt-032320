require 'pry'
class Transfer
  attr_accessor :status, :amount, :status
  attr_reader :sender, :receiver
  
  def initialize(sender, receiver, transfer_amount)
    @sender = sender
    @receiver = receiver
    @amount = transfer_amount
    @status = "pending"
  end

  def valid?
   @sender.valid? && @receiver.valid?
 end

  def execute_transaction
    if valid? && @status == "pending"
      binding.pry
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    elsif !valid? || @status != "pending"
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(-@amount)
      @status = "reversed"
    end
  end
end
