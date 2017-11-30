# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

post1 = Post.create(text: 'I am a random person posting anonymously on this amazing app!', votes: 4, location_id: 2, user_id: 1)
post2 = Post.create(text: 'Did you know that the Los Angeles Clippers are the best team in the NBA, wayyy better than the Golden State Snakes', votes: 2, location_id: 2, user_id: 1, created_at: Time.new(Time.now.year, Time.now.month, Time.now.day, 1, 2))
post3 = Post.create(text: 'Daddy Denero was at the Stanford vs Cal football game!', votes: 3, location_id: 2, user_id: 1, created_at: Time.new(Time.now.year, Time.now.month, Time.now.day, 4))
post4 = Post.create(text: 'The CSS on this project is just amazing, why does it look so beautiful?', votes: -1, location_id: 2, user_id: 1, created_at: Time.new(Time.now.year, Time.now.month, Time.now.day, 4, 20))
post5 = Post.create(text: 'Is this the new Overheard at UC Berkeley???', votes: 69, location_id: 2, user_id: 1)

post1.votes = 4
post1.save

post2.votes = 2
post2.save

post3.votes = 3
post3.save

post4.votes = -1
post4.save

post5.votes = 68
post5.save
