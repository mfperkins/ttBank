class Bank

  attr_reader :balance, :transaction_history

  def initialize
    @balance = 0
    @transaction_history = []
  end

  def deposit(amount, transaction = Transaction)
    deposit = transaction.new("credit", amount)
    @balance += deposit.amount
    @transaction_history.push(deposit)
  end


end
