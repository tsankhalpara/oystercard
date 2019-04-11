require 'station'

describe Station do


  describe '#initialize' do
    subject = Station.new(:name, :zone)
    it 'takes the station name' do
      expect(subject.name).to eq :name
    end
    it 'takes the zone the station is in' do
      expect(subject.zone).to eq :zone
    end
  end

end
