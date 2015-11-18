require 'rails_helper'

RSpec.describe Poll, type: :model do
  it { is_expected.to have_many :ballots }
  it { is_expected.to have_many :users }
end
