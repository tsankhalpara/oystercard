require 'journey'

# -start a journey
# -end a journeys
# -calculate fare
# -journey complete?

describe Journey do

  let(:station) { double :station }

  describe '#start_journey' do
    it 'has an entry station' do
      subject.start_journey(station)
      expect(subject.entry_station).to eq station
    end
  end

  describe '#end_journey' do
    it 'has an exit station' do
      subject.end_journey(station)
      expect(subject.exit_station).to eq station
    end
  end

  describe '#completed_journey?' do

    # context 'has been completed' do
    #   it 'has an entry and exit station' do
    #     expect(subject.completed_journey?).to eq true
    #   end
    # end
  end

  describe '#fare' do

  end



end
