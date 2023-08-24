# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning the database"
Plant.destroy_all
Garden.destroy_all

puts "Populating DB..."
little_garden = Garden.create!(name: "My Little Garden", banner_url: "https://images.unsplash.com/photo-1585320806297-9794b3e4eeae?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1932&q=80")

Garden.create!(name: "My Vegetable Garden", banner_url: "https://images.unsplash.com/photo-1454579943364-13b2d508c27a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80")

Plant.create!(name: "Monstera", image_url: "https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/plants/monstera.jpg", garden: little_garden)
Plant.create!(
  name: "Philo",
  image_url: "https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/plants/philo.jpg",
  garden: little_garden
)

# create an array containing names for tags
names = %w(Fruit\ tree Cactus Greasy\ plant Ferns Conifers)
# iterate over the array to seed some tags
names.each do |name|
  Tag.create!(name: name)
end


puts "Finished seeding..."
