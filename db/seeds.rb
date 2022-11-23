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

20.times do
trail = Trail.create!(
    name: Faker::Mountain.unique.name,
    distance: rand(0.1..50).round(2),
    difficulty: ["Easy", "Intermediate", "Difficult"].sample,
    description: Faker::Quote.famous_last_words,
    duration: rand(10..500).round(2),
    location: Faker::Address.city
  )
end
