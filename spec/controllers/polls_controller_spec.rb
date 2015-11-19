require 'rails_helper'

RSpec.describe PollsController, type: :controller do
  describe "POST #create" do
    subject { post :create }

    it "creates a new poll" do
      expect { subject }.to change { Poll.count }.by(1)
    end
  end
end
