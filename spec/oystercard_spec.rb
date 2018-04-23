require 'oystercard.rb'

describe Oystercard do
  it "has an initial balance of 0 check" do
    expect(subject.balance).to eq 0
  end

  context '#top_up' do
    it "can be topped up with specified amount" do
      value = 20
      subject.top_up(value)
      expect(subject.balance).to eq value
    end

    it "raises error if user tries to top up balance to over £90" do
      subject.top_up(90)
      expect { subject.top_up(1) }.to raise_error("Max balance is #{Oystercard::MAXIMUM_BALANCE}")
    end
  end

  context '#deduct' do
    it "reduces balance by specified amount" do
      subject.top_up(50)
      expect { subject.deduct(10) }.to change { subject.balance }.by -10
    end
  end
end
