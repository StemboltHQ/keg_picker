require 'rails_helper'

RSpec.describe Poll, type: :model do
  it { is_expected.to have_many :ballots }
  it { is_expected.to have_many :users }
  it { is_expected.to have_many :brewery }

  let(:poll) { FactoryGirl.create :poll, closed: closed }
  let(:closed) { false }

  describe '#open?' do
    subject { poll.open? }

    context 'when poll is open' do
      it { is_expected.to be true }
    end

    context 'when poll is closed' do
      let(:closed) { true }
      it { is_expected.to be false }
    end
  end

  describe '#finalize' do
    subject { poll.finalize }

    let(:winner) { FactoryGirl.create :beer }
    let(:loser) { FactoryGirl.create :beer }

    before do
      FactoryGirl.create_list :ballot, 2, beer: winner, poll: poll
      FactoryGirl.create :ballot, beer: loser, poll: poll
    end

    it 'sets the winner_id to the beer with most ballots' do
      expect { subject }.to change { poll.winner }.
        from(nil).to(winner)
    end

    it 'closes the poll' do
      expect { subject }.to change { poll.closed }.
        from(false).to(true)
    end
  end

  describe '#previous_poll' do
    subject { Poll.last.previous }

    let!(:polls) { FactoryGirl.create_list :poll, 2 }

    it "should return the previous poll" do
      expect(subject).to eq(Poll.first)
    end
  end

  describe '#next_poll' do
    subject { Poll.first.next }

    let!(:polls) { FactoryGirl.create_list :poll, 2 }

    it "should return the next poll" do
      expect(subject).to eq(Poll.last)
    end
  end
end
