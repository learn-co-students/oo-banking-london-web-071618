require_relative 'bank_account'
require 'pry'

class Transfer
  attr_reader :receiver_orig_balance, :amount
  attr_accessor :sender, :receiver, :status

  def initialize(sender, receiver, amount, status="pending")
    @sender = sender
    @receiver = receiver
    @receiver_orig_balance = receiver.balance
    @status = status
    @amount = amount
  end

  def valid?
    if @sender.valid? && @receiver.valid? && @sender.balance >= @amount
      return true
    else
      return false
    end
  end

  def execute_transaction
    if self.valid? && self.status == "pending"
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @receiver.balance > @receiver_orig_balance
      @sender.balance = @sender.balance + @amount
      @receiver.balance = @receiver.balance - @amount
      @status = "reversed"
    end
  end
end
