class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if sender.valid? == true && sender.balance >= amount
      if self.status == "pending"
        @sender.balance -= self.amount
        @receiver.balance += self.amount
        self.status = "complete"
      end
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += self.amount
      @receiver.balance -= self.amount
      @status = "reversed"
    end
  end
end
