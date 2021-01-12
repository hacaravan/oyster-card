require 'station'

describe Station do

  describe 'initialize' do

    subject { Station.new("Nunhead", 3) }
    
    it "name is not empty" do
      expect(subject.name).not_to be_empty
    end

    it "zone is not empty" do
      expect(subject.zone).to be_integer
    end

  end

end