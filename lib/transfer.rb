require 'pry'

class Transfer

attr_accessor :amount, :sender, :receiver, :status

def initialize(sender, receiver, amount)
  @amount = amount
  @sender = sender
  @receiver = receiver
  @status = "pending"
end


def valid?
  if sender.valid? && receiver.valid?
    return true
  else
    return false
  end
end

def execute_transaction
  if sender.valid? && sender.balance > amount && self.status == "pending"
    sender.balance = sender.balance - amount
    receiver.balance = receiver.balance + amount
    self.status = "complete"
  else
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer
  if self.status == "complete"
    sender.balance += amount
    receiver.balance -= amount
    self.status = "reversed"
  end
end


end
