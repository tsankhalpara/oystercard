require 'oystercard'

describe Oystercard do
  let(:entry) { double :station }
  let(:exit) { double :station }

  let(:trip) { { entry_station: entry, exit_station: exit } }

  it { is_expected.to respond_to(:balance) }

  describe '#initialize' do
    it 'has an empty list of journeys by default' do
      expect(subject.journeys).to be_empty
    end
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'increases the balance' do
      expect { subject.top_up(1) }.to change { subject.balance }.by(1)
    end

    context 'Exceeded limit' do
      it 'raises error' do
        max = Oystercard::MAX_BALANCE
        subject.top_up(max)
        expect { subject.top_up(max) }.to raise_error "Exceeded limit of #{max}"
      end
    end
  end

  describe '#touch_in' do
    context 'Minimum balance not met' do
      it 'raises error' do
        expect { subject.touch_in(entry) }.to raise_error 'Insufficient funds!'
      end
    end

    context 'Minimum balance met' do
      before do
        subject.instance_variable_set(:@balance, Journey::MIN_FARE)
      end
      it 'Changes in_journey state to true' do
        subject.touch_in(entry)
        expect(subject.in_journey?).to eq true
      end

      it 'stores an entry station' do
        subject.touch_in(entry)
        expect(subject.entry_station).to eq entry
      end
    end
  end

  describe '#touch_out' do
    before do
      subject.instance_variable_set(:@balance, Journey::MIN_FARE)
    end

    it 'Changes in_journey state to false' do
      subject.touch_in(entry)
      subject.touch_out(exit)
      expect(subject.in_journey?).to eq false
    end

    it 'Deducts minimum fare from balance' do
      min = Journey::MIN_FARE
      expect { subject.touch_out(exit) }.to change { subject.balance }.by(-min)
    end

    it 'Forgets the entry station' do
      subject.touch_in(entry)
      subject.touch_out(exit)
      expect(subject.entry_station).to eq nil
    end

    it 'stores an exit station' do
      subject.touch_in(entry)
      subject.touch_out(exit)
      expect(subject.exit_station).to eq exit
    end

    it 'stores the journey history' do
      subject.touch_in(entry)
      subject.touch_out(exit)
      expect(subject.journeys).to include trip
    end
  end
end
