# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |i|
  user = User.create(name: Faker::Name.name)
  event = Event.create(name: Faker::Name.name, user_id: user.id, date: Faker::Date.in_date_period )
  movie = Movie.create!(title: Faker::Movie.title, overview: Faker::Movie.quote, moviedb_id:(i + 2 + 1), image: Faker::LoremFlickr.image)
  event_movie = EventMovie.create(movie_id: movie.id, event_id: event.id, vote: 0)
  binding.pry

end