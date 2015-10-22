require 'rails_helper'

RSpec.describe BeersController, type: :controller do
  let(:beer) { FactoryGirl.create :beer }

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
end
