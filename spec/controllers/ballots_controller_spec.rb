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

    context "creating a new ballot with an open poll" do
    let!(:poll) { FactoryGirl.create :poll }

      it "creates a new ballot" do
        expect { subject }.to change { Ballot.count }.by(1)
      end

      it "assigns a new ballot to the current poll" do
        expect(Ballot.last).to eq(Poll.current.ballots.last)
      end

      context "when trying to create a second ballot" do
        let(:another_beer) { FactoryGirl.create :beer }
        before(:each) do
          post :create, { beer_id: another_beer.id }
        end

        it "creates only one ballot per user per poll" do
          expect(Ballot.count).to eq(1)
        end
      end
    end

    context "creating a new ballot with no open poll" do
      it "does not create a new ballot" do
        expect { subject }.to change { Ballot.count }.by(0)
      end

      it "redirects to the ballots page" do
        subject
        expect(response).to redirect_to(polls_path)
      end

      it "displays the flash message" do
        subject
        expect(flash[:danger]).to be_present
      end
    end
  end

  describe "GET #new" do
    let!(:poll) { FactoryGirl.create :poll }
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

  describe "PATCH update"do
    subject { put :update, id: ballot.to_param, beer_id: another_beer.id }
    let(:another_beer) { FactoryGirl.create :beer, name: "Corona" }

    it "updates the ballot" do
      expect { subject }.to change { ballot.reload.beer.name}.to("Corona")
    end

    it { is_expected.to redirect_to ballots_path }
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
