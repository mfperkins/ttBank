# understands how to make deposits & withdrawals

require_relative 'transaction'

class TransactionHistory

  attr_reader :log

  def initialize
    @log = []
  end

  def deposit(amount, balance, transaction = Transaction)
    deposit = transaction.new("credit", amount, (balance + amount))
    @log.push(deposit)
  end

  def withdrawal(amount, balance, transaction = Transaction)
    withdrawal = transaction.new("debit", amount, (balance - amount))
    @log.push(withdrawal)
  end

end
