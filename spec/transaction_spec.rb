require 'transaction'

describe Transaction do

  subject(:transaction) { described_class.new("credit") }

  describe 'On initialization it ...' do

    it 'should have a timestamp' do
      expect(subject.time).to be_kind_of(Time)
    end

    it "should have an amount of 0" do
      expect(subject.amount).to eq(0)
    end

    it "should have a specific type" do
      expect(subject.type).to eq("credit")
    end


  end


end
