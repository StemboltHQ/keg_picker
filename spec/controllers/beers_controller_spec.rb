require 'rails_helper'

RSpec.describe BeersController, type: :controller do
  let(:beer) { FactoryGirl.create :beer }

  describe "GET #index" do
    subject { get :index }

    let(:beers) { FactoryGirl.create_list :beer, 2 }
    specify { expect(subject.status).to eq 200 }
    it { is_expected.to render_template :index }

    it "assigns all beers as @beers" do
      subject
      expect(assigns(:beers)).to eq beers
    end
  end

  describe "GET #new" do
    subject { get :new }

    it "assigns a new beer to @beer" do
      subject
      expect(assigns(:beer)).to be_a_new(Beer)
    end
  end

  describe "POST #create" do
    subject { post :create, beer: FactoryGirl.attributes_for(:beer)  }

    it "creates a new beer" do
      expect { subject }.to change { Beer.count }.by(1)
    end
  end

  describe "GET #show" do
    subject { get :show, id: beer.to_param }

    specify { expect(subject.status).to eq 200 }
    it { is_expected.to render_template :show }

    it "assigns a beer to @beer" do
      subject
      expect(assigns(:beer)).to eq beer
    end
  end

  describe "DELETE #destroy" do
    subject { delete :destroy, id: beer.to_param }

    let!(:beer) { FactoryGirl.create :beer }

    it "deletes a beer" do
      expect { subject }.to change { Beer.count }.by(-1)
    end

    it { is_expected.to redirect_to "/beers" }
  end

end
