require 'oystercard'

describe Oystercard do

  it { is_expected.to respond_to(:balance)}
  it { is_expected.to respond_to(:in_journey)}

  describe '#initialize' do
    it "Assumes user starts off not in a journey" do
      expect(subject.in_journey).to eq false
    end
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument}

    it 'increases the balance' do
      expect { subject.top_up(1) }.to change { subject.balance }.by(1)
    end

    context "Exceeded limit" do
      it "raises error" do
        max = Oystercard::MAX_BALANCE
        subject.top_up(max)
        expect { subject.top_up 1 }.to raise_error "Exceeded limit of #{max}"
      end
    end
  end


  describe '#touch_in' do
    context 'Minimum balance not met' do
      it "raises error" do
        expect{ subject.touch_in }.to raise_error 'Insufficient funds!'
      end
    end

    context 'Minimum balance met' do
      before do
        subject.instance_variable_set(:@balance, Oystercard::MIN_FARE)
      end
      it "will change in journey state to true" do
        subject.instance_variable_set(:@balance, Oystercard::MIN_FARE)
        subject.touch_in
        expect(subject.touch_in).to eq true
      end
    end
  end

  describe '#touch_out' do
    before do
      subject.instance_variable_set(:@balance, Oystercard::MIN_FARE)
    end

    it "will change in journey state to false" do
      subject.touch_in
      subject.touch_out
      expect(subject.touch_out).to eq false
    end

    it "Deducts minimum fare from balance" do
      min = Oystercard::MIN_FARE
      expect { subject.touch_out }.to change { subject.balance }.by(-min)
    end
  end

end
