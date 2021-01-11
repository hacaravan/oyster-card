require 'oystercard'

describe Oystercard do

  it { is_expected.to respond_to :balance }
  it { is_expected.to respond_to(:top_up).with(1).argument }

  describe '#balance' do
    subject { Oystercard.new.balance }
    it { is_expected.to eq 0 }
  end

  describe '#top_up' do
    let(:card) { Oystercard.new }
    before { card.top_up(amount) }
    it 'adds the amount onto the existing balance' do
      expect(card.balance).to eq amount + balance
    end
  end

end
