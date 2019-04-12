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

    context 'has been completed' do
      it 'has an entry and exit station' do
        subject.start_journey(station)
        subject.end_journey(station)
        expect(subject.completed_journey?).to eq true
      end
    end

    context 'has not been completed' do
      it 'has no entry station' do
        subject.end_journey(station)
        expect(subject.completed_journey?).to eq false
      end

      it 'has no exit_station' do
        subject.start_journey(station)
        expect(subject.completed_journey?).to eq false
      end
    end
  end

  describe '#fare' do
    context 'completed journey' do
      it 'returns the minimum fare' do
        min = Oystercard::MIN_FARE
        subject.start_journey(station)
        subject.end_journey(station)
        expect(subject.fare).to eq min
      end
    end

    context 'either no entry or exit station' do
      it 'returns penalty fare' do
        penalty = Journey::PENALTY_FARE
        expect(subject.fare).to eq penalty
      end
    end

  end



end
