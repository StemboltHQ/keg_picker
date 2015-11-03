require 'rails_helper'
require 'cancan/matchers'

RSpec.describe User, type: :model do
  AccessToken = Struct.new(:info)

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

  describe '#find_for_google_oauth2' do
    let(:username) { "RobertK" }
    subject { User.find_for_google_oauth2(AccessToken.new("email" => email)) }

    context "when user exists" do
      let!(:user) { FactoryGirl.create(:user, username: username) }
      let(:email) { user.email }

      it { is_expected.to eq(user) }

      it "should not create the second user" do
        expect(User.count).to eq 1
      end
    end

    context "when user does not exist yet" do
      let(:email) { "newuser@gmail.com" }

      it "creates a new user" do
        expect { subject }.to change { User.count }.by(1)
      end

      it "creates a user with the correct attributes" do
        subject.update_attributes("username" => username)
        expect(User.last).to have_attributes( email: "newuser@gmail.com", username: "RobertK" )
      end
    end
  end
end
