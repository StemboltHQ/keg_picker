require 'rails_helper'

RSpec.describe Brewery, type: :model do
  it { is_expected.to have_many :beers }
  it { is_expected.to have_many :polls }
end
