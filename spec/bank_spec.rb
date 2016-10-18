require 'bank'

describe Bank do

  subject(:bank) { described_class.new }
  let(:deposit_class) {double :deposit_class, new: deposit_transaction }

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

    it 'should have a balance of $2500' do
      expect(subject.balance).to eq(2500)
    end

    it 'should add a transaction to the history' do
      expect(subject.transaction_history.length).to eq(3)
    end
  end

end
