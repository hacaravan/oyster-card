require 'oystercard'

describe Oystercard do

  # it { is_expected.to respond_to :balance }
  # it { is_expected.to respond_to(:top_up).with(1).argument }

  describe '#balance' do
    subject { Oystercard.new.balance }
    it { is_expected.to eq 0 }
  end

  describe '#top_up' do
    it 'adds the amount onto the existing balance' do
     expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end
    context 'when trying to top up above the limit' do
      let(:limit) { Oystercard::LIMIT}
      it 'should raise an error' do
        expect{ subject.top_up limit + 1 }.to raise_error "You cannot top up above £#{limit}. You are at £#{subject.balance}"
      end
    end
  end

  describe "#deduct" do
    it "deducts the amount of the fare from the balance" do
      expect{ subject.deduct 1 }.to change{ subject.balance }.by -1
    end
  end

  describe '#in_journey?' do
    subject { Oystercard.new.in_journey? }
    it 'should return true or false' do
      expect(subject).to be(true).or be false
    end
    context 'when a card is first created' do
      it 'should return false' do
        expect(subject).to be false
      end
    end
  end

end
