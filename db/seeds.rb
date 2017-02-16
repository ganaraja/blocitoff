require 'faker'

50.times do
user =  User.new(
    email: Faker::Internet.email,
    password:Faker::Internet.password
  )
  user.skip_confirmation!
  user.save
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
