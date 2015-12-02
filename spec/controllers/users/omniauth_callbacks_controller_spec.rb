require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController, type: :controller do

  describe "google" do
    let!(:user) { FactoryGirl.create(:user) }
    let(:omni_auth) { { "omniauth.auth" => { "extra" => { "user_hash" => { "email" => user.email, "name" => user.username, "uid" => "1234567789000000" } } } } }

    before(:each) do
      allow(@controller).to receive(:env).and_return(omni_auth)
      request.env["devise.mapping"] = Devise.mappings[:user]
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google]
      OmniAuth.config.mock_auth[:google].info.email = user.email
    end

    it "assigns user to @user" do
      get :google, email: "test@google.com"
      expect(assigns(:user)).to eq(user)
    end

    it "signs in the the user" do
      get :google
      expect(subject.current_user).to eq(user)
    end

    it "redirects to the main page" do
      get :google
      expect(response).to redirect_to "/"
    end
  end
end
