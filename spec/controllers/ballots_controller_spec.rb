require 'rails_helper'

RSpec.describe BallotsController, type: :controller do
  authorize_and_login
  describe "POST #create" do
    let(:beer) { FactoryGirl.create :beer }
    let(:user) { FactoryGirl.create :user }
    subject { post :create, { beer_id: beer.id } }

    it "creates a new ballot" do
      expect { subject }.to change { Ballot.count }.by(1)
    end
  end

end
