require 'rails_helper'

RSpec.describe BallotsController, type: :controller do
  authorize_and_login
  let(:user) { FactoryGirl.create :user }
  let!(:beer) { FactoryGirl.create :beer }
  let(:ballot) { FactoryGirl.create :ballot }

  describe "GET #index" do
    subject { get :index }

    let(:ballots) { FactoryGirl.create_list :ballot, 2 }
    specify { expect(subject.status).to eq 200 }
    it { is_expected.to render_template :index }

    it "assigns all ballots as @ballots" do
      subject
      expect(assigns(:ballots)).to eq ballots
    end
  end

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

  describe "GET #show" do
    subject { get :show, id: ballot.to_param }

    specify { expect(subject.status).to eq 200 }
    it { is_expected.to render_template :show }

    it "assigns a ballot to @ballot" do
      subject
      expect(assigns(:ballot)).to eq ballot
    end
  end

  describe "PATCH update"do
    subject { put :update, id: ballot.to_param, beer_id: another_beer.id }
    let(:another_beer) { FactoryGirl.create :beer, brand: "Corona" }

    it "updates the ballot" do
      expect { subject }.to change { ballot.reload.beer.brand}.to("Corona")
    end

    it { is_expected.to redirect_to ballot }
  end

  describe "DELETE #destroy" do
    subject { delete :destroy, id: ballot.to_param }

    let!(:ballot) { FactoryGirl.create :ballot }

    it "deletes a beer" do
      expect { subject }.to change { Ballot.count }.by(-1)
    end

    it { is_expected.to redirect_to "/ballots" }
  end
end
