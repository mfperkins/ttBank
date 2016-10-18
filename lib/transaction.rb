class Transaction

  attr_reader :time, :amount, :type

  def initialize(type, amount)
    @time = Time.new
    @amount = amount
    @type = type
  end

end
