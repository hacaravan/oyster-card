require 'journey'

describe Journey do

  context 'when first created' do

    it 'should not have an entry station' do
      expect(subject.entry_station).to be_nil
    end

    it 'should not have an exit station' do
      expect(subject.exit_station).to be_nil
    end

  end

  describe '#start_journey' do
    let(:entry_station) { Station.new("Peckham Rye", 2) }
    before { subject.start_journey(entry_station) }
    it 'should add an entry station' do
      expect(subject.entry_station).to eq entry_station
    end
  end
  
  describe '#end_journey' do
    let(:exit_station) { Station.new("Nunhead", 3) }
    before { subject.end_journey(exit_station) }
      it 'should add an exit station' do
        expect(subject.exit_station).to eq exit_station    
      end
  end
  
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
