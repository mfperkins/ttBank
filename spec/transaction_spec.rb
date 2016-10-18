require 'transaction'

describe Transaction do

  amount = 10
  current_balance = 0
  subject(:transaction) { described_class.new("credit", amount, current_balance) }

  describe 'On initialization it ...' do

    it 'should have a timestamp' do
      expect(subject.get_time).to be_kind_of(Time)
    end

    it "should have an amount passed in" do
      expect(subject.get_amount).to eq(amount)
    end

    it "should have a specific type" do
      expect(subject.get_type).to eq("credit")
    end

    it 'should have a current balance of 0' do
      expect(subject.get_current_balance).to eq(current_balance)
    end

  end

end
