FactoryBot.define do
  factory :event do
    date { "2022-08-30 08:55:30" }
    name { "MyString" }
    users { nil }
    movie_selection_id { 1 }
  end
end
