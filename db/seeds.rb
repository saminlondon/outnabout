# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# users = [maaz, kamal, yeon]
# # queens =Venue.create(name: "Queensway Skate Bowl Dine", address: "17 Queensway, London", description: "Join us for an evening of bowling, skating or dining", user_id: maaz)
# # flight = Venue.create(name: "Flight Club", address: "111 Victoria, London", description: "Join us for an evening of darts", user_id: kamal)
# # karts = Venue.create(name: "Capital Karts", address: "125 Canary Wharf, London", description: "Join us for an evening of Go Karting", user_id: kamal)

# # bowling = Activity.create(name: "Bowling", description: "11 Bowling alleys accomodating 6 each", operational_start_time: "2022-11-29 10:00:00", operational_end_time: "2022-11-29 22:00:00", activity_party_size: 6, price: 13, category: "bowling", venue_id: queens)
# i = 0
# 3.times do
#   venue = Venue.create(name: "Queensway Skate Bowl Dine", address: "17 Queensway, London", description: "Join us for an evening of bowling, skating or dining", user_id: users[i])
#   2.times do
#     Activity.create(name: "Bowling", description: "11 Bowling alleys accomodating 6 each", operational_start_time: "2022-11-29 10:00:00", operational_end_time: "2022-11-29 22:00:00", activity_party_size: 6, price: 13, category: "bowling", venue_id: venue.id)
#   end
#   i += 1
# end
#  puts "done"

Slot.destroy_all
Activity.destroy_all
Venue.destroy_all
User.destroy_all

maaz = User.create(first_name: "Maaz", last_name: "Sattar", email: "maaz@test.com", password:"123456", is_host?: true, address: "W22AN")
kamal = User.create(first_name: "Kamal", last_name: "Minott", email: "kamal@test.com", password:"123456", is_host?: true, address: "W22AK")
yeon = User.create(first_name: "Yeon", last_name: "Kim", email: "yeon@test.com", password:"123456", is_host?: false, address: "W22AY")

venue = Venue.create(name: "Queensway Skate Bowl Dine", address: "17 Queensway, London", description: "Join us for an evening of bowling, skating or dining", user_id: maaz.id)
venue2 = Venue.create(name: "Capital Karts", address: "95 Brick Ln, London E1 6QL", description: "Join us for an evening of bowling, skating or dining", user_id: kamal.id)
venue3 = Venue.create(name: "Flight Club", address: "17 Queensway, London", description: "Join us for an evening of bowling, skating or dining", user_id: yeon.id)

activity = Activity.create(name: "Bowling", description: "11 Bowling alleys accomodating 6 each", operational_start_time: "2022-11-29 10:00:00", operational_end_time: "2022-11-29 22:00:00", activity_party_size: 6, price: 13, category: "bowling", venue_id: venue.id)

i = 10
until i == 22
  Slot.create!(activity: activity, start_time: DateTime.new(2022, 12, 2, i, 0, 0), end_time: DateTime.new(2022, 12, 2, (i+1), 0, 0) )
  i += 1
end

# puts "created #{Slot.count} slots"
activity2 = Activity.create(name: "Skating", description: "11 Bowling alleys accomodating 6 each", operational_start_time: "2022-11-29 10:00:00", operational_end_time: "2022-11-29 22:00:00", activity_party_size: 6, price: 13, category: "bowling", venue_id: venue.id)

i = 11
until i == 23
  Slot.create!(activity: activity2, start_time: DateTime.new(2022, 12, 2, i, 0, 0), end_time: DateTime.new(2022, 12, 2, (i+1), 0, 0) )
  i += 1
end

activity3 = Activity.create(name: "Karting", description: "11 Bowling alleys accomodating 6 each", operational_start_time: "2022-11-29 10:00:00", operational_end_time: "2022-11-29 22:00:00", activity_party_size: 6, price: 13, category: "bowling", venue_id: venue2.id)
i = 10
until i == 20
  Slot.create!(activity: activity3, start_time: DateTime.new(2022, 12, 2, i, 0, 0), end_time: DateTime.new(2022, 12, 2, (i+1), 0, 0) )
  i += 1
end

activity4 = Activity.create(name: "Darts", description: "11 Bowling alleys accomodating 6 each", operational_start_time: "2022-11-29 10:00:00", operational_end_time: "2022-11-29 22:00:00", activity_party_size: 6, price: 13, category: "bowling", venue_id: venue3.id)
i = 12
until i == 23
  Slot.create!(activity: activity4, start_time: DateTime.new(2022, 12, 2, i, 0, 0), end_time: DateTime.new(2022, 12, 2, (i+1), 0, 0) )
  i += 1
end
