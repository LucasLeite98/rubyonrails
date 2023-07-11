FactoryBot.define do 
    factory :character do 
        nickname { FFaker::Lorem.word }
        level { FFaker::Random.rand{1..99} }
        kind { %i[knight wizard].sample }
    end
end
