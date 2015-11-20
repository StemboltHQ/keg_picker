class Ballot < ActiveRecord::Base
  belongs_to :user
  belongs_to :beer
  belongs_to :poll
  validates :user_id, uniqueness: { scope: :poll, message: "You can vote only once" }
end
