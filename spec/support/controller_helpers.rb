module ControllerHelpers
  def login
    before(:each) do
      unless user.nil?
        @request.env["devise.mapping"] = Devise.mappings[:user]
        allow(@controller).to receive(:current_user).and_return(user)
        sign_in user
      end
    end
  end
end
