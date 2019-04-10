require 'oystercard'

describe Oystercard do

  it { is_expected.to respond_to(:balance)}

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

end
