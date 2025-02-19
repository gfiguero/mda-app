# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# frozen_string_literal: true

# https://marvelcinematicuniverse.fandom.com/wiki/Stark_Industries
platform_admin = User.create(first_name: "Platform", last_name: "Admin", email: "admin@mdagestion.cl", password: "12345678", platform_admin: true)

# The marvel users:
iron_man = User.create(first_name: "Tony", last_name: "Stark", email: "ironman@marvel.com", password: "12345678")
captain_america = User.create(first_name: "Steve", last_name: "Rogers", email: "cap@marvel.com", password: "12345678")
black_widow = User.create(first_name: "Natasha", last_name: "Romanoff", email: "blackwidow@marvel.com", password: "12345678")
thor = User.create(first_name: "Thor", last_name: "Odinson", email: "thor@marvel.com", password: "12345678")
hulk = User.create(first_name: "Bruce", last_name: "Banner", email: "hulk@marvel.com", password: "12345678")
black_panther = User.create(first_name: "T'Challa", last_name: "Black Panther", email: "blackpanther@marvel.com", password: "12345678")
spider_man = User.create(first_name: "Peter", last_name: "Parker", email: "spiderman@marvel.com", password: "12345678")
dr_strange = User.create(first_name: "Stephen", last_name: "Strange", email: "drstrange@marvel.com", password: "12345678")
nick_fury = User.create(first_name: "Nick", last_name: "Fury", email: "nickfury@marvel.com", password: "12345678")
professor_x = User.create(first_name: "Charles", last_name: "Xavier", email: "professorx@marvel.com", password: "12345678")
fantastic_four = User.create(first_name: "Reed", last_name: "Richards", email: "reedrichards@marvel.com", password: "12345678")


total_employees = 3000
batch_size = 1000
total_employees.times.each_slice(batch_size) do |batch|
  employees = batch.map do
    {
      first_name: [Faker::Name.first_name,Faker::Name.first_name].join(" "),
      last_name: [Faker::Name.last_name,Faker::Name.last_name].join(" "),
      identification_number: Faker::ChileRut.rut,
      identification_code: Faker::ChileRut.check_digit,
      identification_type: "ChileRut",
      email_address: Faker::Internet.email,
      created_at: DateTime.now,
      updated_at: DateTime.now
    }
  end
  Employee.insert_all(employees)
  puts "#{batch.size} empleados creados en el lote."
end
puts "#{total_employees} empleados creados exitosamente."
