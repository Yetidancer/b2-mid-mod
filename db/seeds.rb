# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

studio_1 = Studio.create(name: "A24")
studio_2 = Studio.create(name: "Warner Brothers")
movie_1 = Movie.create(name: "Parasite",
                        creation: "2019",
                        genre: "Horror",
                        studio_id: "#{studio_1.id}")
movie_2 = Movie.create(name: "Titanic",
                        creation: "2000",
                        genre: "Drama",
                        studio_id: "#{studio_1.id}")
movie_3 = Movie.create(name: "Get Out",
                        creation: "2016",
                        genre: "Horror",
                        studio_id: "#{studio_2.id}")
movie_4 = Movie.create(name: "Toy Story",
                        creation: "1995",
                        genre: "Childrens",
                        studio_id: "#{studio_2.id}")
actor_1 = Actor.create(name: "Tom Hanks",
                        age: 58,
                        movies: [movie_2,movie_4])
actor_2 = Actor.create(name: "Mr. Bean",
                        age: 42,
                        movies: [movie_1,movie_3])
