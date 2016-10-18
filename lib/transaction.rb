#understands the details of one transaction

class Transaction

  def initialize(type, amount, current_balance)
    @time = Time.new
    @amount = amount
    @type = type
    @current_balance = current_balance
  end

  def get_time
    time
  end

  def get_amount
    amount
  end

  def get_type
    type
  end

  def get_current_balance
    current_balance
  end

  private

  attr_reader :time, :amount, :type, :current_balance

end
