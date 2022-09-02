# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do |i|
  movie = MovieFacade.new
  seed_info = movie.top_movie_seeding(i+1)
  seed_info.each do |seed|
    Movie.create(seed)
  end
end


user_1 = User.create(name: "user_1")
user_2 = User.create(name: "user_2")
user_3 = User.create(name: "user_3")
user_4 = User.create(name: "user_4")
user_5 = User.create(name: "user_5")

event_1 = Event.create!(date: "6/23/2023", name: "event_1", user_id: user_1.id, guest_id: user_4.id)
event_2 = Event.create!(name: "event_2", user_id: user_4.id, guest_id: user_3.id, date: "6/23/2023" )
event_3 = Event.create!(name: "event_3", user_id: user_3.id, guest_id: user_2.id, date: "6/23/2023" )
event_4 = Event.create!(name: "event_4", user_id: user_2.id, guest_id: user_5.id, date: "6/23/2023" )
event_5 = Event.create!(name: "event_5", user_id: user_5.id, guest_id: user_1.id, date: "6/23/2023" )

# 5.times do |i|
#   user = User.create!(name: Faker::Name.name)
#   event = Event.create!(name: Faker::Name.name, user_id: user.id, date: Faker::Date.in_date_period )
#   movie = Movie.create!(title: Faker::Movie.title, moviedb_id:(i + 2 + 1), image: Faker::LoremFlickr.image)
#   event_movie = EventMovie.create(movie_id: movie.id, event_id: event.id, vote: 0)
# end
