require 'faker'

50.times do
  User.create!(
    email: Faker::Internet.email,
    password:Faker::Internet.password
  )
end

users = User.all

100.times do
  Item.create!(
    name: Faker::Name.name,
    user: users.sample
  )
end

puts "Seeds finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
