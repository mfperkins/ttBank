require 'account'

describe Account do

  subject(:account) { described_class.new }

  describe 'On initialization it ...' do

    it 'should have an empty transaction history' do
      expect(subject.transaction_history).to eq([])
    end

    it "should have a balance lf 0" do
      expect(subject.balance).to eq(0)
    end

  end

  describe 'A $1000 deposit' do

    before(:each) do
      subject.deposit(1000)
    end

    it 'should increase the balance by 10' do
      expect(subject.balance).to eq(1000)
    end

    it 'should add a transaction to the history' do
      expect(subject.transaction_history.length).to eq(1)
    end
  end

  describe 'A $500 withrawal after another $2000 deposit' do

    before(:each) do
      subject.deposit(1000)
      subject.deposit(2000)
      subject.withdrawal(500)
    end

    it 'should show balance of $2500' do
      expect(subject.balance).to eq(2500)
    end

    it 'should have 3 transactions in the history' do
      expect(subject.transaction_history.length).to eq(3)
    end

  end

  describe 'Printing a bank statement for the 3 transactions' do

    before(:each) do
      subject.deposit(1000)
      subject.deposit(2000)
      subject.withdrawal(500)
    end

    it 'should show all transactions and details' do
      expect { subject.statement }.to output("    date    || credit || debit || balance\n2016/10/18 ||  || 500 || 2500\n2016/10/18 || 2000 ||  || 3000\n2016/10/18 || 1000 ||  || 1000\n").to_stdout
    end


  end

end
