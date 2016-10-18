require 'account'

describe Account do

  subject(:account) { described_class.new(transactionHistory_class) }
  let(:transactionHistory_class) { double :transactionHistory_class, new: transactionHistory }
  let(:transactionHistory) {double :transactionHistory, deposit: nil, withdrawal: nil, log: [transaction1, transaction2, transaction3]}
  let(:transaction1) {double :transaction1, time: Time.new, type: "credit", amount: 1000, current_balance: 1000 }
  let(:transaction2) {double :transaction2, time: Time.new, type: "credit", amount: 2000, current_balance: 3000 }
  let(:transaction3) {double :transaction3, time: Time.new, type: "debit", amount: 500, current_balance: 2500 }

  describe 'On initialization it ...' do

    it "should have a balance lf 0" do
      expect(subject.balance).to eq(0)
    end

    it 'should have an empty transaction history' do
      expect(subject.transaction_history).to eq(transactionHistory)
    end

  end

  describe 'A $1000 deposit' do

    before(:each) do
      subject.deposit(1000)
    end

    it 'should increase the balance by 1000' do
      expect(subject.balance).to eq(1000)
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
