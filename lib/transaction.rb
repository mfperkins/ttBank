#understands the details of one transaction

class Transaction

  attr_reader :time, :amount, :type, :current_balance

  def initialize(type, amount, current_balance)
    @time = Time.new
    @amount = amount
    @type = type
    @current_balance = current_balance
  end

end
