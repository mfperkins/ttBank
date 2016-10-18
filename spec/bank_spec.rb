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

  describe 'A $10 deposit' do

    before(:each) do
      subject.deposit(10)
    end

    it 'should increase the balance by 10' do
      expect(subject.balance).to eq(10)
    end

    it 'should add a transaction to the history' do
      expect(subject.transaction_history).to_not be_empty
    end
  end

end
