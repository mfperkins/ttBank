# understands how to make deposits & withdrawals

require_relative 'transaction'

class TransactionHistory

  attr_reader :log

  def initialize
    @log = []
  end

  def deposit(amount, transaction = Transaction)
    deposit = transaction.new("credit", amount)
    deposit.set_balance(amount)
    @log.push(deposit)
  end

  def withdrawal(amount, transaction = Transaction)
    withdrawal = transaction.new("debit", amount)
    withdrawal.set_balance(amount)
    @log.push(withdrawal)
  end

end
