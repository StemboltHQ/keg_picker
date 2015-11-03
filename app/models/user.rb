class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.find_for_google_oauth2(access_token, _signed_in_resource = nil)
    data = access_token.info
    User.where(email: data["email"]).first_or_create! do |user|
      user.email = data["email"]
      user.username = data["first_name"]
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
