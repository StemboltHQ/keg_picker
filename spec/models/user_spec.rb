require 'rails_helper'
require 'cancan/matchers'

RSpec.describe User, type: :model do
  it "is invalid without parameters" do
    expect(described_class.new().valid?).to be false
  end

  describe "abilities" do
    subject(:ability) { Ability.new(user) }

    context "when user is an admin" do
      let(:user) { FactoryGirl.create(:admin) }

      it "has an ability to edit" do
        expect(ability).to be_able_to(:edit, Beer.new)
      end
    end
  end
end
