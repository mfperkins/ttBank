#understands the details of one transaction

class Transaction

  attr_reader :time, :amount, :type, :current_balance

  def initialize(type, amount)
    @time = Time.new
    @amount = amount
    @type = type
    @current_balance = 0
  end

  def set_balance(amount)
    @current_balance = amount
  end

end
