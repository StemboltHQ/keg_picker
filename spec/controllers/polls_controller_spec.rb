require 'rails_helper'

RSpec.describe PollsController, type: :controller do
  authorize_and_login
  let(:user) { FactoryGirl.create :admin }
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

  describe "PATCH update"do
    let(:poll) { FactoryGirl.create(:poll) }
    subject { put :update, id: poll.to_param, closed: true, ended_at: Time.now }

    it "updates the poll" do
      expect { subject }.to change { poll.reload.closed}.to(true)
    end

    it "updates the ended_at attribute" do
      allow(Time).to receive(:now).and_return(Time.parse("2015-11-23 09:36:22"))
      expect { subject }.to change { poll.reload.ended_at}.to(Time.now)
    end

    it { is_expected.to redirect_to polls_path }
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
