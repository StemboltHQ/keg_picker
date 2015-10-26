require 'rails_helper'

RSpec.describe User, type: :model do
  it "is invalid without parameters" do
    expect(described_class.new().valid?).to be false
  end
end
