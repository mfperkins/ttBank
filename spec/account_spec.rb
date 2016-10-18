require 'account'

describe Account do

  subject(:account) { described_class.new(transactionHistory_class) }
  let(:transactionHistory_class) { double :transactionHistory_class, new: transactionHistory }
  let(:transactionHistory) {double :transactionHistory, deposit: nil, withdrawal: nil, get_log: [transaction1, transaction2, transaction3]}
  let(:transaction1) {double :transaction1, get_time: Time.new, get_type: "credit", get_amount: 1000, get_current_balance: 1000 }
  let(:transaction2) {double :transaction2, get_time: Time.new, get_type: "credit", get_amount: 2000, get_current_balance: 3000 }
  let(:transaction3) {double :transaction3, get_time: Time.new, get_type: "debit", get_amount: 500, get_current_balance: 2500 }
  first_amount = 1000
  second_amount = 2000
  third_amount = 500

  describe 'On initialization it ...' do

    it "should have a balance lf 0" do
      expect(subject.get_balance).to eq(0)
    end

    it 'should have an empty transaction history' do
      expect(subject.get_transaction_history).to eq(transactionHistory)
    end

  end

  describe 'A $1000 deposit' do

    before(:each) do
      subject.deposit(first_amount)
    end

    it 'should increase the balance by 1000' do
      expect(subject.get_balance).to eq(1000)
    end

  end

  describe 'A $500 withrawal after another $2000 deposit' do

    before(:each) do
      subject.deposit(first_amount)
      subject.deposit(second_amount)
      subject.withdrawal(third_amount)
    end

    it 'should show balance of $2500' do
      expect(subject.get_balance).to eq(2500)
    end

  end

  describe 'Printing a bank statement for the 3 transactions' do

    before(:each) do
      subject.deposit(first_amount)
      subject.deposit(second_amount)
      subject.withdrawal(third_amount)
    end

    it 'should show all transactions and details' do
      expect { subject.statement }.to output("    date    || credit || debit || balance\n2016/10/18 ||  || 500 || 2500\n2016/10/18 || 2000 ||  || 3000\n2016/10/18 || 1000 ||  || 1000\n").to_stdout
    end

  end

  describe 'Edge cases' do

    it 'should only allow you to deposit an integer' do
      msg = "That's not a number!"
      expect{subject.deposit("hello")}.to raise_error(msg)
    end

    it 'should only allow you to withdraw an integer' do
      msg = "That's not a number!"
      expect{subject.deposit(nil)}.to raise_error(msg)
    end

  end

end
