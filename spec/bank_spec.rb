require 'bank'

describe Bank do

  subject(:bank) { described_class.new }

  describe 'On initialization it ...' do

    it 'should have an empty transaction history' do
      expect(subject.transaction_history).to eq([])
    end

    it "should have a balance lf 0" do
      expect(subject.balance).to eq(0)
    end

  end

end
