class Beer < ActiveRecord::Base
  validates :brand, presence: true, length: {minimum: 3 }
  validates :brand, uniqueness: { case_sensitive: false }
  has_many :ballots, dependent: :destroy
end
