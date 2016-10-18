# understands a customer's balance

require_relative 'transaction_history'

class Account

  def initialize(transaction_history = TransactionHistory)
    @balance = 0
    @transaction_history = transaction_history.new
  end

  def deposit(amount)
    fail "That's not a number!" if amount.is_a?(Integer) == false
    transaction_history.deposit(amount, balance)
    @balance += amount
  end

  def withdrawal(amount)
    fail "That's not a number!" if amount.is_a?(Integer) == false 
    transaction_history.withdrawal(amount, balance)
    @balance -= amount
  end

  def statement
    transactions_to_print = transaction_history.get_log.reverse
    puts "    date    || credit || debit || balance"
    transactions_to_print.each do |transaction|
      puts "#{get_date(transaction)} || #{get_credit_amount(transaction)} || " +
      "#{get_debit_amount(transaction)} || #{transaction.get_current_balance}"
    end
  end

  def get_transaction_history
    transaction_history
  end

  def get_balance
    balance
  end

  private

  attr_reader :transaction_history, :balance

  def get_date(transaction)
    transaction.get_time.strftime("%Y/%m/%d")
  end

  def get_credit_amount(transaction)
    transaction.get_type == "credit" ? transaction.get_amount : nil
  end

  def get_debit_amount(transaction)
    transaction.get_type == "debit" ? transaction.get_amount : nil
  end

end
