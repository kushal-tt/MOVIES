FactoryBot.define do
  factory :rating do
    # user { FactoryBot.create(:user) }
    # movie { FactoryBot.create(:movie) }
    score { 4 }
    review { 'Great movie!' }
    association :user
    association :movie

    
  end
end