require 'oystercard'

describe Oystercard do

  it { is_expected.to respond_to :balance }
  it { is_expected.to respond_to(:top_up).with(1).argument }

  describe '#balance' do
    subject { Oystercard.new.balance }
    it { is_expected.to eq 0 }
  end

  describe '#top_up' do

    it 'adds the amount onto the existing balance' do
     expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end
  end

end
