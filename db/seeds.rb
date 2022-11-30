# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require "json"
require "faker"

puts "Clearing old data..."
Trail.destroy_all
Trip.destroy_all
User.destroy_all
Category.destroy_all

puts "Creating users..."
users_filepath = "db/users.json"
serialized_users = File.read(users_filepath)
users = JSON.parse(serialized_users)
users.each do |user|
  User.create!(
    email: user["email"],
    password: 'password',
    first_name: user["first_name"],
    last_name: user["last_name"]
  )
end

puts "Creating categories..."
Category.create!(name: 'Muddy')
Category.create!(name: 'Lots of mosquitoes')
Category.create!(name: 'Uneven path')
Category.create!(name: 'Monkey sighting')
Category.create!(name: 'Great views')

# puts "Creating tags..."
# Tag.create!(review: Review.first, category: Category.first)
# Tag.create!(review: Review.first, category: Category.last)
# Tag.create!(review: Review.last, category: Category.first)



puts "Creating trails..."
trails_filepath = "db/trails.json"
serialized_trails = File.read(trails_filepath)
trails = JSON.parse(serialized_trails)
trails.each do |trail|
  puts "Creating #{trail['name']}..."
  new_trail = Trail.new(
    name: trail["name"],
    distance: trail["distance"],
    difficulty: trail["difficulty"],
    description: trail["description"],
    duration: trail["duration"],
    location: trail["location"]
  )
  trail["photos"].each_with_index do |photo_url, i|
    file = URI.open(photo_url)
    new_trail.photos.attach(io: file, filename: "#{trail['name'].split.first}#{i + 1}.jpg", content_type: "image/jpg")
  end
  new_trail.save
end

puts "Creating trips..."
User.all.each do |user|
  rand(3..5).times do
    new_trip = Trip.new(
      user:,
      trail: Trail.all.sample,
      date: DateTime.parse("2022-11-#{rand(28..30)}T#{rand(6..17)}:00+08:00")
    )
    new_trip.save(validate: false)
  end
end

puts "Creating reviews..."
Trip.where('date < ?', Time.now).each do |trip|
  Review.create!(
    user: trip.user,
    trip:,
    rating: rand(3..5),
    comment: Faker::Lorem.sentence(word_count: 5, supplemental: true, random_words_to_add: 5)
  )
end

puts "Done!"
