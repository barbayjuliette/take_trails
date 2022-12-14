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
User.destroy_all
Trail.destroy_all
Category.destroy_all
Trip.destroy_all
Review.destroy_all

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
    location: trail["location"],
    coordinates: trail["coordinates"]
  )
  trail["photos"].each_with_index do |photo_url, i|
    file = URI.open(photo_url)
    new_trail.photos.attach(io: file, filename: "#{trail['name'].split.first}#{i + 1}.jpg", content_type: "image/jpg")
  end
  new_trail.save
end

puts "Creating categories..."
Category.create!(name: 'Muddy paths')
Category.create!(name: 'Many mosquitoes')
Category.create!(name: 'Uneven paths')
Category.create!(name: 'Monkey sightings')
Category.create!(name: 'Family-friendly')
Category.create!(name: 'Great views')
Category.create!(name: 'Uphill climbs')
Category.create!(name: 'Coastal/water views')
Category.create!(name: 'Dense forests')

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

puts "Creating past trips with no reviews for demo..."
sungei = Trail.find_by(name: 'Sungei Buloh Wetland Reserve Short Loop')
user_xe = User.find_by(first_name: 'Xing Ern')
user_xx = User.find_by(first_name: 'Xiaoxi')
user_jb = User.find_by(first_name: 'Juliette')
user_rj = User.find_by(first_name: 'Raihan')
# past trip with no reviews
trip_xe = Trip.new(user: user_xe, trail: sungei, date: DateTime.parse("2022-11-#{rand(28..30)}T#{rand(6..17)}:00+08:00"))
trip_xe.save(validate: false)
trip_xx = Trip.new(user: user_xx, trail: sungei, date: DateTime.parse("2022-11-#{rand(28..30)}T#{rand(6..17)}:00+08:00"))
trip_xx.save(validate: false)
trip_jb = Trip.new(user: user_jb, trail: sungei, date: DateTime.parse("2022-11-#{rand(28..30)}T#{rand(6..17)}:00+08:00"))
trip_jb.save(validate: false)
trip_rj = Trip.new(user: user_rj, trail: sungei, date: DateTime.parse("2022-11-#{rand(28..30)}T#{rand(6..17)}:00+08:00"))
trip_rj.save(validate: false)
# xe, xx, jb to create reviews and add photos to Sungei Buloh trails in the website

puts "Done!"
