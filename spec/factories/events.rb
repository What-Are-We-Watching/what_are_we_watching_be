FactoryBot.define do
  factory :event do
    date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    name { Faker::Name.name }
    movie_selection_id {Faker::Number.within(range: 1..5)}

    association :user, factory: :user
  end
end
