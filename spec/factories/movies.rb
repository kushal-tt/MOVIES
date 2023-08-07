FactoryBot.define do
  factory :movie do
    title { Faker::Name.name }
    description {'this is an example description'}
    genre_id { FactoryBot.create(:genre).id }
    release_date {Date.today}
    image { nil }

  end
end