require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do

  describe "AccessDenied" do
    controller do
      def new
        raise CanCan::AccessDenied.new()
      end
    end

    context "when user is not logged in" do
      before do
        get :new
      end

      it "should redirect to the root page" do
        expect(response).to redirect_to(root_url)
      end
    end
  end
end
