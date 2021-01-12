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
    context 'when trying to top up above the max balance' do
      let(:max_balance) { Oystercard::MAX_BALANCE}
      it 'should raise an error' do
        expect{ subject.top_up max_balance + 1 }.to raise_error "You cannot top up above £#{max_balance}. You are at £#{subject.balance}"
      end
    end
  end

  describe '#in_journey?' do
    it "should initially not be in a journey" do
      expect(subject).not_to be_in_journey
    end
  end

  describe "initialize" do
    it "a new empty list of journeys" do
      expect(subject.journey_list).to be_empty
    end
  end

  describe "#touch_in" do
    let(:station) { double("Peckham Rye") }
    context "when you have enough for a journey" do
      min_balance = Oystercard::MIN_BALANCE
      before do
        subject.top_up(min_balance)
        subject.touch_in(station)
      end
      it "can touch in" do
        expect(subject).to be_in_journey
      end
      it "remembers the entry station" do
        expect(subject.entry_station).to eq station
      end
    end

    context "when you don't have enough for a journey" do
      it 'should raise an error' do
        min_balance = Oystercard::MIN_BALANCE
        subject.top_up(min_balance - 0.01)
        expect { subject.touch_in(station) }.to raise_error "Insufficient funds to touch in. You need at least £#{min_balance} and you have £#{subject.balance}"
      end
    end
  end

  describe '#touch_out' do
    context "when you have completed a journey" do
      min_balance = Oystercard::MIN_BALANCE
      let(:station) { double("Peckham Rye") }
      let(:exit_station) { double("Nunhead") }
      before do
        subject.top_up(min_balance)
        subject.touch_in(station)
      end
      it 'can touch out' do
        subject.touch_out(exit_station)
        expect(subject).not_to be_in_journey
      end
      it "charges you the fare for your journey" do
        expect { subject.touch_out(exit_station) }.to change{ subject.balance }.by -(min_balance)
      end
      it "Remembers the exit station" do
        subject.touch_out(exit_station)
        expect(subject.exit_station).to eq exit_station
      end
      it "Forgets entry station" do
        subject.touch_out(exit_station)
        expect(subject.entry_station).to be nil
      end
      it "Displays entry/exit stations when touched out" do
        subject.touch_out(exit_station)
        expect(subject.journey_list).to eq(entry_station: station, exit_station: exit_station)
      end
    end
  end

end
