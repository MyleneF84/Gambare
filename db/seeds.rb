# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Transaction.destroy_all
Project.destroy_all
User.destroy_all

puts "Creating Users..."

user1 = User.create!(first_name: "Paul", last_name: "Berg", email: "pb@aol.fr", password: "qwerty")
user2 = User.create!(first_name: "Cathy", last_name: "Chen", email: "cc@aol.fr", password: "qwerty")

puts "Users created !"

puts "Creating Projects..."

project1 = Project.create!(name: "Trip to Hawai", goal_amount: 600, start_date: Date.today, end_date: Date.today + 6.months )
project2 = Project.create!(name: "Xmas gifts", goal_amount: 400, start_date: Date.today, end_date: Date.new(2024, 12, 23) )
project3 = Project.create!(name: "New headset", goal_amount: 200, start_date: Date.today - 1.month, end_date: Date.today, achieved: true )

puts "Projects created !"

puts "Creating Transactions..."

transactions = Transaction.create!([{ project_id: project1.id, user_id: user1.id, amount: 100 },
  { project_id: project2.id, user_id: user1.id, amount: 50 },
  { project_id: project1.id, user_id: user2.id, amount: 200 },
  { project_id: project3.id, user_id: user1.id, amount: 200 }])

puts "Transactions created, all good !"
