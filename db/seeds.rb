# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

City.destroy_all
Dogsitter.destroy_all
Dog.destroy_all
Stroll.destroy_all


### Create 5 cities
5.times do
  City.create(city_name: Faker::Address.city)
end

### Create 50 dogsitters
50.times do
  Dogsitter.create(name: Faker::Name.first_name, age: rand(16..75), 
  city: City.all.sample)
end

### Create 200 dogs
200.times do
  Dog.create(name: Faker::Creature::Dog.name, age: rand(1..15), 
  race: Faker::Creature::Dog.breed, city: City.all.sample)
end

### Create 500 strolls
500.times do
  Stroll.create(dogsitter: Dogsitter.all.sample)
end

### Create connection Dog to Stroll
Dog.all.each do |dog|
  city_dog = dog.city
  dogsitter_dog = Dogsitter.all.where(city: city_dog).sample
  stroll_dog = Stroll.all.where(dogsitter: dogsitter_dog).sample
  dog.strolls << stroll_dog
end

### Create connection Stroll to Dog
Stroll.all.each do |stroll|
  city_stroll = stroll.dogsitter.city
  dog_stroll = Dog.all.where(city: city_stroll).sample
  stroll.dogs << dog_stroll
end