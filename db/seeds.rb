# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts "Clearing old data..."
Trail.destroy_all
Trip.destroy_all
User.destroy_all

puts "Creating users..."
# fai = User.create!(
#   email: 'email@email.com',
#   password: '123123',
#   first_name: 'Fai',
#   last_name: 'Rude'
# )
zh = User.create!(
  email: 'email1@email.com',
  password: '123123',
  first_name: 'Zong',
  last_name: 'Ha'
)
# rich = User.create!(
#   email: 'rich@email.com',
#   password: '123123',
#   first_name: 'Rich',
#   last_name: 'Ard'
puts "Creating zh's..."

2.times do
trail = Trail.create!(
    name: "Marang Trail",
    distance: 3.2,
    difficulty: "Easy",
    duration: 54,
    location: "Mount Faber Park"
  )
end
