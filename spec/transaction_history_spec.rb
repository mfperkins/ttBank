require 'transaction_history'

describe TransactionHistory do

  first_amount = 1000
  second_amount = 2000
  third_amount = 500
  first_balance = 0
  second_balance = 1000
  third_balance = 3000

  subject(:transactionHistory) { described_class.new }

  describe 'A $1000 deposit' do

    before(:each) do
      subject.deposit(first_amount, first_balance)
    end

    it 'should add a transaction to the history' do
      expect(subject.get_log.length).to eq(1)
    end
  end

  describe 'A $500 withrawal after another $2000 deposit' do

    before(:each) do
      subject.deposit(first_amount, first_balance)
      subject.deposit(second_amount, second_balance)
      subject.withdrawal(third_amount,third_balance)
    end

    it 'should have 3 transactions in the history' do
      expect(subject.get_log.length).to eq(3)
    end

  end

end
