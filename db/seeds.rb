# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

User.create!(name: "管理者",
             email: "admin@email.com",
             password: "password",
             password_confirmation: "password",
             employee_number: "111",
             uid: "11",
             admin: true)
             
User.create!(name: "上長A",
             email: "superior_a@email.com",
             password: "password",
             password_confirmation: "password",
             employee_number: "112",
             uid: "12",
             superior: true)

User.create!(name: "上長B",
             email: "superior_b@email.com",
             password: "password",
             password_confirmation: "password",
             employee_number: "113",
             uid: "13",
             superior: true)

60.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               employee_number: "11#{n+4}",
               uid: "1#{n+4}",)
end