# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.find_by_username('ask')

unless u
	u = User.create(username: 'ask', email: 'ask@mail.com', password: 'qwerty', password_confirmation: 'qwerty')
end

5.times do |i|
	name = "Trip #{i}"
	days = rand(14)
	trip = Trip.create(name: name, country: 'United States', length: days, user: u)
	puts "Trip: #{name} created"
	4.times do |j|
		activity_name = "Activity #{+1}"
		start = Date.new()
		trip.activities.create(name: activity_name, description: 'COOL ACTIVITY', start: start , end: start + days.days )
		puts "Activity #{activity_name} created"
	end
end