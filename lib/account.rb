# understands a customer's balance

require_relative 'transaction_history'

class Account

  attr_reader :balance, :transaction_history

  def initialize(transaction_history = TransactionHistory)
    @balance = 0
    @transaction_history = transaction_history.new
  end

  def deposit(amount)
    transaction_history.deposit(amount, balance)
    @balance += amount
  end

  def withdrawal(amount)
    transaction_history.withdrawal(amount, balance)
    @balance -= amount
  end

  def statement
    transactions_to_print = transaction_history.log.reverse
    puts "    date    || credit || debit || balance"
    transactions_to_print.each do |transaction|
      puts "#{get_date(transaction)} || #{get_credit_amount(transaction)} || " +
      "#{get_debit_amount(transaction)} || #{transaction.current_balance}"
    end
  end

  private

  def get_date(transaction)
    transaction.time.strftime("%Y/%m/%d")
  end

  def get_credit_amount(transaction)
    transaction.type == "credit" ? transaction.amount : nil
  end

  def get_debit_amount(transaction)
    transaction.type == "debit" ? transaction.amount : nil
  end



end
