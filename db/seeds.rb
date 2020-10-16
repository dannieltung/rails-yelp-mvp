# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database....'
Restaurant.destroy_all


puts 'Database is clean!'

puts 'Creating restaurants...'

30.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: ['chinese', 'italian', 'japanese', 'french', 'belgian'].sample
  )
  50.times do
    @review = Review.create(
      content: Faker::Restaurant.review,
      rating: rand(1..5),
      restaurant: restaurant
    )
  end

  puts "restaurant id# #{restaurant.id} and review id# #{@review.id} created."
end

puts 'done'
