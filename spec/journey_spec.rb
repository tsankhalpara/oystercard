require 'journey'

describe Journey do

  it { is_expected.to respond_to(:in_journey)}

  describe '#initialize' do
    it "Assumes user starts off not in a journey" do
      expect(subject.in_journey).to eq false
    end
  end

  describe '#touch_in' do
    it "will change in journey state to true" do
      subject.touch_in
      expect(subject.touch_in).to eq true
    end
  end

  describe '#touch_out' do
    it "will change in journey state to false" do
      subject.touch_out
      expect(subject.touch_out).to eq false
    end
  end
end
