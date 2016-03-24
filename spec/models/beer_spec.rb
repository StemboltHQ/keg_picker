require 'rails_helper'

RSpec.describe Beer, type: :model do

  it { is_expected.to have_many :ballots }
  it { is_expected.to belong_to :brewery }

  it "is invalid without a name" do
    expect(described_class.new.valid?).to be false
  end

  it "is valid with a name at least three characters long" do
    expect(described_class.new(name: "Hop Circle IPA").valid?).to be true
  end

  it "is invalid with a name less than three characters long" do
    expect(described_class.new(name: "No").valid?).to be false
  end
end
