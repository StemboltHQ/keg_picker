class Beer < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3 }
  validates :name, uniqueness: { case_sensitive: false }
  has_many :ballots, dependent: :destroy
  belongs_to :brewery
end
