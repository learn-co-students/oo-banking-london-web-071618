class BankAccount
attr_reader :name
  attr_accessor :balance, :status

  #initialize account with name a default balance and statuys of open
  def initialize(name, balance=1000, status="open")
    @name = name
    @balance = balance
    @status = status
  end

  #be able to deposit money into account
  def deposit(amount)
    @balance += amount
  end

  #display the balance of account
  def display_balance
    return "Your balance is $#{@balance}."
  end

  #check if account is valid- a plus balance and open
  def valid?
    if @balance > 0 && @status == "open"
      return true
    else
      return false
    end
  end

#change account status to closed
  def close_account
    @status = "closed"
  end

end
