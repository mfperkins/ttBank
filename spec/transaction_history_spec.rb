require 'transaction_history'

describe TransactionHistory do

  subject(:transactionHistory) { described_class.new }

  describe 'On initialization it ...' do

    it 'should have an empty history array' do
      expect(subject.log).to eq([])
    end

  end

  describe 'A $1000 deposit' do

    before(:each) do
      subject.deposit(1000)
    end

    it 'should add a transaction to the history' do
      expect(subject.log.length).to eq(1)
    end
  end

  describe 'A $500 withrawal after another $2000 deposit' do

    before(:each) do
      subject.deposit(1000)
      subject.deposit(2000)
      subject.withdrawal(500)
    end

    it 'should have 3 transactions in the history' do
      expect(subject.log.length).to eq(3)
    end

  end

end
