require 'rails_helper'

RSpec.describe BallotsController, type: :controller do
  authorize_and_login
  let(:user) { FactoryGirl.create :user }
  let!(:beer) { FactoryGirl.create :beer }

  describe "POST #create" do
    subject { post :create, { beer_id: beer.id } }

    it "creates a new ballot" do
      expect { subject }.to change { Ballot.count }.by(1)
    end
  end

  describe "GET #new" do
    subject { get :new }

    it "assigns beers to @beers" do
      subject
      expect(assigns(:beers)).to eq(Beer.all)
    end

    it "assigns a new ballot to @ballot" do
      subject
      expect(assigns(:ballot)).to be_a_new(Ballot)
    end
  end
end
