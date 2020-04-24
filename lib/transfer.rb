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
      binding.pry
      @sender.deposit(@mount)
      @receiver.deposit(-@amount)
      binding.pry
      @status = "reversed"
    end
  end
end
