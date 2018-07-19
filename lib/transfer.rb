require_relative 'bank_account.rb'
require 'pry'
class Transfer

  attr_reader
  attr_accessor :sender, :receiver, :status, :amount

    def initialize(sender, receiver, status = "pending", amount)
      @sender = sender
      @receiver = receiver
      @status = status
      @amount = amount
    end

    def valid?
      @sender.valid? && @receiver.valid?
    end

    def execute_transaction
      if self.status == "pending" && @sender.balance >= amount
        @sender.balance -= amount
        @receiver.balance += amount
        self.status = "complete"
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end

    def reverse_transfer
      if self.status == 'complete' && @receiver.balance >= amount && @sender.valid? && @receiver.valid?
          @sender.balance += amount
          @receiver.balance -= amount
          self.status = "reversed"
      else
        "Cannot reverse"
      end

    end
end
#
#
# acc_1 = BankAccount.new("Adam")
# acc_2 = BankAccount.new("Eve")
# trans = Transfer.new(acc_1, acc_2, 500)
#  binding.pry
