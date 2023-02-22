require 'faker'

puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating 5 restaurants...'
5.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    phone_number: Faker::PhoneNumber.phone_number,
    category: %w[chinese italian japanese french belgian].sample
  )
  restaurant.save!
  review = Review.new(
    rating: rand(0..5),
    content: Faker::Restaurant.review,
    restaurant: restaurant
  )
  review.save!
end
puts 'Finished!'
