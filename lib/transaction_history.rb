# understands how to make deposits & withdrawals

require_relative 'transaction'

class TransactionHistory

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

  def get_log
    log
  end

  private

  attr_reader :log

end
