require 'rails_helper'

RSpec.describe Character, type: :model do
  it "is invalid id the level is not between 1 and 99" do
    nickname = FFaker::Name.first_name
    kind = %i[knight wizard].sample
    level = FFaker::Random.rand(100..999)
    character = Character.new(nickname: nickname, kind: kind, level: level)

    expect(character).to_not be_valid
  end
  it "returns the correct hero title" do
    nickname = FFaker::Name.first_name
    kind = %i[knight wizard].sample
    level = FFaker::Random.rand(1..99)
    character = Character.new(nickname: nickname, kind: kind, level: level)

    expect(character.title).to eq("#{kind} #{nickname} ##{level}")
  end 
end
