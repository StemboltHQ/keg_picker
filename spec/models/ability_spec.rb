require 'spec_helper'
require 'cancan/matchers'

RSpec.describe Ability, type: :model do
  let(:user) { FactoryGirl.build_stubbed :user }
  let(:ability) { Ability.new(user) }

  subject { ability}
  context "when user is not an administartor" do
    it { is_expected.to be_able_to :read, :all }
  end

  context "when user is an administartor" do
    let(:user) { FactoryGirl.create :admin }
    it { is_expected.to be_able_to :manage, :all }
  end
end
