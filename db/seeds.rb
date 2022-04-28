# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(username: "Khoa Nguyen", password: "password")
movie = Movie.create(url:"https://www.youtube.com/watch?v=heVMX8KSU4c")
UserMovie.create(user_id: user.id, movie_id: movie.id)