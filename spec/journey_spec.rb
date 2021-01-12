require 'journey'

describe Journey do

  context 'when first created' do
    it 'should not have started a journey' do
      expect(subject).not_to be_started
    end
  end

  describe '#start_journey' do
    let(:entry_station) { Station.new("Peckham Rye", 2) }
    before { subject.start_journey(entry_station) }
    it 'should add an entry station' do
      expect(subject.entry_station).to eq entry_station
    end
    it 'should have started a journey' do
      expect(subject).to be_started
    end
  end
  #
  # describe '#end_journey' do
  #   it 'should add an exit station' do
  #
  #   end
  # end
  #
  # describe '#calculate_fare' do
  #   context 'when there is an exit and entry station' do
  #     it 'should give the charge for travelling between the two zones' do
  #
  #     end
  #   end
  #
  #   context 'when there is no exit station' do
  #     it 'should give a penalty charge' do
  #
  #     end
  #   end
  #
  #   context 'when there is no entry station' do
  #     it 'should give a penalty charge' do
  #
  #     end
  #   end

end
