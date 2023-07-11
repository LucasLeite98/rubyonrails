require 'rails_helper'

RSpec.describe Character, type: :model do
  it "is invalid the level is not between 1 and 99" do
    character = build(:character, level: FFaker::Random.rand(100..999))
    expect(character).to_not be_valid
  end
  it "returns the correct hero title" do
    character = create(:character)
    expect(character.title).to eq("#{character.kind} #{character.nickname} ##{character.level}")
  end 
end
