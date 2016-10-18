# understands a customer's balance

class Account

  attr_reader :balance, :transaction_history, :statement

  def initialize
    @balance = 0
    @transaction_history = []
  end

  def deposit(amount, transaction = Transaction)
    deposit = transaction.new("credit", amount)
    @balance += deposit.amount
    deposit.set_balance(balance)
    @transaction_history.push(deposit)
  end

  def withdrawal(amount, transaction = Transaction)
    withdrawal = transaction.new("debit", amount)
    @balance -= withdrawal.amount
    withdrawal.set_balance(balance)
    @transaction_history.push(withdrawal)
  end

  def statement
    transactions_to_print = transaction_history.reverse
    puts "    date    || credit || debit || balance"
    transactions_to_print.each do |transaction|
      puts "#{get_date(transaction)} || #{get_credit_amount(transaction)} || #{get_debit_amount(transaction)} || #{transaction.current_balance}"
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
