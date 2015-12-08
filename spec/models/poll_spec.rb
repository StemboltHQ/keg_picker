require 'rails_helper'

RSpec.describe Poll, type: :model do
  it { is_expected.to have_many :ballots }
  it { is_expected.to have_many :users }

  let!(:polls) { FactoryGirl.create_list :poll, 2 }
  describe '#previous_poll' do
    subject { Poll.last.previous }
    it "should return the previous poll" do
      expect(subject).to eq(Poll.first)
    end
  end

  describe '#next_poll' do
    subject { Poll.first.next }
    it "should return the next poll" do
      expect(subject).to eq(Poll.last)
    end
  end
end
