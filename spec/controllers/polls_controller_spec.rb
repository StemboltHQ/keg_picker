require 'rails_helper'

RSpec.describe PollsController, type: :controller do
  describe "GET #index" do
    subject { get :index }

    let(:polls) { FactoryGirl.create_list :poll, 2 }
    specify { expect(subject.status).to eq 200 }
    it { is_expected.to render_template :index }

    it "assigns all polls as @polls" do
      subject
      expect(assigns(:polls)).to eq polls
    end
  end

  describe "POST #create" do
    subject { post :create }

    it "creates a new poll" do
      expect { subject }.to change { Poll.count }.by(1)
    end
  end

  describe "DELETE #destroy" do
    subject { delete :destroy, id: poll.to_param }

    let!(:poll) { FactoryGirl.create :poll }

    it "deletes a beer" do
      expect { subject }.to change { Poll.count }.by(-1)
    end

    it { is_expected.to redirect_to "/polls" }
  end
end
