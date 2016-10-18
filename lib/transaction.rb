class Transaction

  attr_reader :time, :amount, :type

  def initialize(type)
    @time = Time.new
    @amount = 0
    @type = type
  end




end
