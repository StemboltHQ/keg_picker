require 'rails_helper'

RSpec.describe Poll, type: :model do
  it { is_expected.to have_many :ballots }
  it { is_expected.to have_many :users }

  let(:poll) { FactoryGirl.create :poll }

  describe '#find_winner' do
    subject { poll.find_winner }

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
