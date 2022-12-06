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


require "open-uri"

Slot.destroy_all
Activity.destroy_all
Venue.destroy_all
User.destroy_all

maaz = User.create(first_name: "Maaz", last_name: "Sattar", email: "maaz@test.com", password: "123456", is_host?: true, address: "W22AN")
kamal = User.create(first_name: "Kamal", last_name: "Minott", email: "kamal@test.com", password: "123456", is_host?: true, address: "W22AK")
yeon = User.create(first_name: "Yeon", last_name: "Kim", email: "yeon@test.com", password: "123456", is_host?: false, address: "W22AY")

venue = Venue.create(name: "QUEENS Skate Dine Bowl", address: "17 Queensway, London W2 4QP", description: "Join us for an evening of bowling, skating or dining", user_id: maaz.id)

file = URI.open("https://queens.london/images/uploads/activities/_small/download-3.jpg")
  venue.photo.attach(io: file, filename: "venue.jpg", content_type: "image/jpg")

venue2 = Venue.create(name: "Capital Karts Canary Wharf", address: "15 Cabot Square, London, E14 4QS", description: "Race at our brand new track located at Canary Wharf: Drive the UK's fastest indoor go karting track", user_id: kamal.id)

file = URI.open("https://dynamic-media-cdn.tripadvisor.com/media/photo-o/26/6e/cb/6a/our-next-generation-electric.jpg?w=1100&h=400&s=1")
  venue2.photo.attach(io: file, filename: "venue2.jpg", content_type: "image/jpg")

venue3 = Venue.create(name: "Flight Club Shoreditch", address: "2a Worship Street, London EC2A 2AH", description: "Try your hand at Social Darts, where groups of friends can enjoy fast-paced games, glorious cocktails and delicious sharing plates in your own playing area.", user_id: yeon.id)

file = URI.open("https://flightclubdarts.com/files/sliders/fc-locations-shoreditch-photo-gallery-1.jpg?73cb8177bc")
  venue3.photo.attach(io: file, filename: "venue3.jpg", content_type: "image/jpg")


activity = Activity.create(name: "Bowling", description: "11 Bowling alleys accomodating 6 each", operational_start_time: "2022-11-29 10:00:00", operational_end_time: "2022-11-29 22:00:00", activity_party_size: 6, price: 13, category: "bowling", venue_id: venue.id)

file = URI.open("https://queens.london/images/uploads/activities/_small/download-1.jpg")
  activity.photo.attach(io: file, filename: "activity.jpg", content_type: "image/jpg")


i = 10
until i == 22
  Slot.create!(activity: activity, start_time: DateTime.new(2022, 12, 2, i, 0, 0), end_time: DateTime.new(2022, 12, 2, (i+1), 0, 0) )
  i += 1
end

# puts "created #{Slot.count} slots"
activity2 = Activity.create(name: "Skating", description: "London's only all year-round ice rink. Whether you are a pro or just playin'", operational_start_time: "2022-11-29 10:00:00", operational_end_time: "2022-11-29 22:00:00", activity_party_size: 50, price: 14, category: "skating", venue_id: venue.id)

file = URI.open("https://queens.london/images/uploads/activities/_small/5.jpg")
  activity2.photo.attach(io: file, filename: "activity2.jpg", content_type: "image/jpg")

i = 11
until i == 23
  Slot.create!(activity: activity2, start_time: DateTime.new(2022, 12, 2, i, 0, 0), end_time: DateTime.new(2022, 12, 2, (i+1), 0, 0) )
  i += 1
end

activity3 = Activity.create(name: "Karting", description: "Adult, Junior and Family go karting", operational_start_time: "2022-11-29 10:00:00", operational_end_time: "2022-11-29 22:00:00", activity_party_size: 30, price: 28, category: "karting", venue_id: venue2.id)

file = URI.open("https://dynamic-media-cdn.tripadvisor.com/media/photo-o/26/6e/cb/6a/our-next-generation-electric.jpg?w=900&h=400&s=1")
  activity3.photo.attach(io: file, filename: "activity3.jpg", content_type: "image/jpg")

i = 10
until i == 20
  Slot.create!(activity: activity3, start_time: DateTime.new(2022, 12, 2, i, 0, 0), end_time: DateTime.new(2022, 12, 2, (i+1), 0, 0) )
  i += 1
end

activity4 = Activity.create(name: "Social Darts", description: "Social darts with friends", operational_start_time: "2022-11-29 10:00:00", operational_end_time: "2022-11-29 22:00:00", activity_party_size: 6, price: 13, category: "darts", venue_id: venue3.id)

file = URI.open("https://flightclubdarts.com/files/sliders/social-darts-flight-club-01.jpg?bd04216523")
  activity4.photo.attach(io: file, filename: "activity4.jpg", content_type: "image/jpg")

i = 12
until i == 23
  Slot.create!(activity: activity4, start_time: DateTime.new(2022, 12, 2, i, 0, 0), end_time: DateTime.new(2022, 12, 2, (i+1), 0, 0) )
  i += 1
end

venue5 = Venue.create(name: "All Star Lanes Brick Lane", address: "95 Brick Lane, London E1 6QL", description: "London's original good time. Grab your crew and roll with us!", user_id: maaz.id)

file = URI.open("https://www.allstarlanes.co.uk/sites/default/files/styles/gallery_image_rectangle/public/ASL-BrickLa_013_1.jpg?itok=i0Al-Omp")
  venue5.photo.attach(io: file, filename: "venue5.jpg", content_type: "image/jpg")


  activity5 = Activity.create(name: "Bowling", description: "11 Bowling alleys accomodating 7 poeple each", operational_start_time: "2022-11-29 10:00:00", operational_end_time: "2022-11-29 22:00:00", activity_party_size: 6, price: 13, category: "bowling", venue_id: venue5.id)

  file = URI.open("https://www.allstarlanes.co.uk/sites/default/files/styles/gallery_image_rectangle/public/ASLwhite-1755-Edit.jpg?itok=GTRErWe9")
  activity5.photo.attach(io: file, filename: "activity5.jpg", content_type: "image/jpg")

  i = 12
  until i == 23
    Slot.create!(activity: activity5, start_time: DateTime.new(2022, 12, 2, i, 0, 0), end_time: DateTime.new(2022, 12, 2, (i+1), 0, 0) )
    i += 1
  end

  activity6 = Activity.create(name: "Karaoke", description: "Luxury karaoke rooms hosting up to 14 people, choose your track and take tthe mic for a night to remember", operational_start_time: "2022-11-29 10:00:00", operational_end_time: "2022-11-29 22:00:00", activity_party_size: 14, price: 13, category: "Karaoke", venue_id: venue5.id)

  file = URI.open("https://www.allstarlanes.co.uk/sites/default/files/styles/gallery_image_rectangle/public/White%20City%20Karaoke.jpg?itok=HarC0ORq")
  activity6.photo.attach(io: file, filename: "activity6.jpg", content_type: "image/jpg")

  i = 12
  until i == 23
    Slot.create!(activity: activity6, start_time: DateTime.new(2022, 12, 2, i, 0, 0), end_time: DateTime.new(2022, 12, 2, (i+1), 0, 0) )
    i += 1
  end

  activity7 = Activity.create(name: "Undartables Club", description: "Gather your crew and get some target practice in with our new iteractive darts game", operational_start_time: "2022-11-29 10:00:00", operational_end_time: "2022-11-29 22:00:00", activity_party_size: 14, price: 13, category: "Darts", venue_id: venue5.id)

  file = URI.open("https://www.allstarlanes.co.uk/sites/default/files/styles/gallery_image_rectangle/public/Darts%20Dan.jpg?itok=3D4877nl")
  activity7.photo.attach(io: file, filename: "activity7.jpg", content_type: "image/jpg")

  i = 12
  until i == 23
    Slot.create!(activity: activity7, start_time: DateTime.new(2022, 12, 2, i, 0, 0), end_time: DateTime.new(2022, 12, 2, (i+1), 0, 0) )
    i += 1
  end


venue6 = Venue.create(name: "Revolution Karting", address: "422-424 the Arches, Burdett Road, Mile End, London E3 4AA", description: "Outdorr Go Karting LondoN. Based in Mile End on the Central Line our 550m floodlight track can provide speeds in excess of 45 mph making it the fastest track in Central London", user_id: kamal.id)


file = URI.open("https://i0.wp.com/revolutionkarting.com/wp-content/uploads/2019/02/overtake-blk-white-psd.jpg?fit=956%2C640&ssl=1")
  venue6.photo.attach(io: file, filename: "venue6.jpg", content_type: "image/jpg")

  activity8 = Activity.create(name: "Karting", description: "London's place to race", operational_start_time: "2022-11-29 10:00:00", operational_end_time: "2022-11-29 22:00:00", activity_party_size: 20, price: 30, category: "karting", venue_id: venue6.id)

  file = URI.open("https://i0.wp.com/revolutionkarting.com/wp-content/uploads/2019/01/revolution-karting-13.jpg?fit=1024%2C681&ssl=1")
  activity8.photo.attach(io: file, filename: "activity8.jpg", content_type: "image/jpg")

  i = 12
  until i == 23
    Slot.create!(activity: activity8, start_time: DateTime.new(2022, 12, 2, i, 0, 0), end_time: DateTime.new(2022, 12, 2, (i+1), 0, 0) )
    i += 1
  end



venue7 = Venue.create(name: "Escape Plan", address: "35-47 Bethnal Green Road, London E1 6LA", description: "Escape Plan is a thrilling London Escape Room operator based in Shoreditch. Our experiences are set against the fascinating backdrop of the 1940's:", user_id: yeon.id)


file = URI.open("https://escapeplanltd.com/wordpress/wp-content/uploads/2015/09/escape-plan-slide-1.jpg")
  venue7.photo.attach(io: file, filename: "venue7.jpg", content_type: "image/jpg")

  activity9 = Activity.create!(name: "The Battle for Britain", description: "A unique escape room experience where you are scored on aircraft shot down as you defend England", operational_start_time: "2022-11-29 10:00:00", operational_end_time: "2022-11-29 22:00:00", activity_party_size: 6, price: 30, category: "escape room", venue_id: venue7.id)

  file = URI.open("https://escapeplanltd.com/wordpress/wp-content/uploads/2019/03/Barrel-Badge.jpg")
  activity9.photo.attach(io: file, filename: "activity9.jpg", content_type: "image/jpg")

  i = 12
  until i == 23
    Slot.create!(activity: activity9, start_time: DateTime.new(2022, 12, 2, i, 0, 0), end_time: DateTime.new(2022, 12, 2, (i+1), 0, 0) )
    i += 1
  end

  activity10 = Activity.create(name: "Roll out the barrel", description: "A light-hearted romp, packed full of unusual mechanics, engaging pzzles and a cheeky mission to steal the beer!", operational_start_time: "2022-11-29 10:00:00", operational_end_time: "2022-11-29 22:00:00", activity_party_size: 5, price: 30, category: "escape room", venue_id: venue7.id)

  file = URI.open("https://escapeplanltd.com/wordpress/wp-content/uploads/2019/03/Barrel-Badge.jpg")
  activity10.photo.attach(io: file, filename: "activity10.jpg", content_type: "image/jpg")

  i = 12
  until i == 23
    Slot.create!(activity: activity10, start_time: DateTime.new(2022, 12, 2, i, 0, 0), end_time: DateTime.new(2022, 12, 2, (i+1), 0, 0) )
    i += 1
  end

  activity11 = Activity.create(name: "The adventure begins", description: "Classic escape room format with varied puzzles and tactile mechanics.", operational_start_time: "2022-11-29 10:00:00", operational_end_time: "2022-11-29 22:00:00", activity_party_size: 6, price: 30, category: "escape room", venue_id: venue7.id)

  file = URI.open("https://escapeplanltd.com/wordpress/wp-content/uploads/2015/07/cropped-EscapePlan-TAB.jpg")
  activity11.photo.attach(io: file, filename: "activity11.jpg", content_type: "image/jpg")

  i = 12
  until i == 23
    Slot.create!(activity: activity11, start_time: DateTime.new(2022, 12, 2, i, 0, 0), end_time: DateTime.new(2022, 12, 2, (i+1), 0, 0) )
    i += 1
  end


venue8 = Venue.create(name: "Alexandra Palace Ice Rink", address: "Alexandra Palace Way, London N22 7AY", description: "We have regular skates aged 3 to 90 years old and cater for every standard imaginable, from first timers all the way up to seasoned pros and notional chhampions.", user_id: maaz.id)

file = URI.open("https://cdn.londonandpartners.com/asset/alexandra-palace-ice-skating-rink-f4a1d8ea1625998ea3eec3de80d761fa.jpg")
  venue8.photo.attach(io: file, filename: "venue8.jpg", content_type: "image/jpg")


  activity12 = Activity.create(name: "Ice Skating", description: "Skating has been described as the closed you can get to the feeling of flying, without the leaving the ground!", operational_start_time: "2022-11-29 10:00:00", operational_end_time: "2022-11-29 22:00:00", activity_party_size: 100, price: 10, category: "skating", venue_id: venue8.id)

  file = URI.open("https://littlebird-images-rfqejm1r.netdna-ssl.com/media/cache/resolve/web_full/images/5919ca40cb7ff.jpg")
  activity12.photo.attach(io: file, filename: "activity12.jpg", content_type: "image/jpg")

  i = 12
  until i == 23
    Slot.create!(activity: activity12, start_time: DateTime.new(2022, 12, 2, i, 0, 0), end_time: DateTime.new(2022, 12, 2, (i+1), 0, 0) )
    i += 1
  end


venue9 = Venue.create(name: "Hollywood Bowl", address: "Surrey Quays Leisure Park, Surrey Quays Rd, London SE16 7LW", description: "Bringing great games of bowling plus fantastic food and drinks all under one roof, makes our Hollywood Bowl Surrey Quays centre the ideal place to visit.", user_id: maaz.id)

file = URI.open("https://www.hollywoodbowlgroup.com/application/files/8116/4459/8948/BOWL_Press-Release_Images_11.jpg")
  venue9.photo.attach(io: file, filename: "venue9.jpg", content_type: "image/jpg")

  activity13 = Activity.create(name: "Bowling", description: "With 28 lanes to bowl along, a VIP area fit for the starts, an american themed diner, a buzzing bar and thrilling amusements area", operational_start_time: "2022-11-29 10:00:00", operational_end_time: "2022-11-29 22:00:00", activity_party_size: 100, price: 7, category: "bowling", venue_id: venue9.id)

  file = URI.open("https://www.hollywoodbowl.co.uk/imager/objectstoragemosaicsquare/173138/Bowling-extra-tile-5_c6a6b0da22a43bcc1ebc969398df9e2a.webp")
  activity13.photo.attach(io: file, filename: "activity13.jpg", content_type: "image/jpg")


  i = 12
  until i == 23
    Slot.create!(activity: activity13, start_time: DateTime.new(2022, 12, 2, i, 0, 0), end_time: DateTime.new(2022, 12, 2, (i+1), 0, 0) )
    i += 1
  end

venue10 = Venue.create(name: "Enigma Quests", address: "2-12 Wilson St, London EC2M 7LS", description: "We create experiences for those seeking to live out the life of an adventurer, explore new worlds and face challenges that will test their courage, quick thinking and creativity.", user_id: maaz.id)

file = URI.open("https://enigmaquests.london/Content/DynamicMedia/cms-uploaded/images/00013web.jpg")
  venue10.photo.attach(io: file, filename: "venue10.jpg", content_type: "image/jpg")

  activity14 = Activity.create(name: "School of witchcraft and wizardry", description: "Inspired by classic fantasy worlds like Harry Poter.", operational_start_time: "2022-11-29 10:00:00", operational_end_time: "2022-11-29 22:00:00", activity_party_size: 5, price: 100, category: "escape room", venue_id: venue10.id)

  file = URI.open("https://enigmaquests.london/Content/DynamicMedia/Rooms/ListPage/1003_Image.jpg")
  activity14.photo.attach(io: file, filename: "activity14.jpg", content_type: "image/jpg")

  i = 12
  until i == 23
    Slot.create!(activity: activity14, start_time: DateTime.new(2022, 12, 2, i, 0, 0), end_time: DateTime.new(2022, 12, 2, (i+1), 0, 0) )
    i += 1
  end

  activity15 = Activity.create(name: "The million pound heist", description: "Analysing confidential information.Besting the world's most advanced security network. Cracking the door to a top-secret criminal vault.", operational_start_time: "2022-11-29 10:00:00", operational_end_time: "2022-11-29 22:00:00", activity_party_size: 5, price: 100, category: "escape room", venue_id: venue10.id)

  file = URI.open("https://enigmaquests.london/Content/DynamicMedia/Rooms/ListPage/1002_Image.jpg")
  activity15.photo.attach(io: file, filename: "activity15.jpg", content_type: "image/jpg")

  i = 12
  until i == 23
    Slot.create!(activity: activity15, start_time: DateTime.new(2022, 12, 2, i, 0, 0), end_time: DateTime.new(2022, 12, 2, (i+1), 0, 0) )
    i += 1
  end

activity16 = Activity.create(name: "Submarine: mission wavebreak", description: "A rogue nuclear submarine is poised to set off a catastrophic tsunami across the globe, and the only chance to stop it rests on your shoulders", operational_start_time: "2022-11-29 10:00:00", operational_end_time: "2022-11-29 22:00:00", activity_party_size: 5, price: 100, category: "escape room", venue_id: venue10.id)

file = URI.open("https://enigmaquests.london/Content/DynamicMedia/Rooms/ListPage/1009_Image.jpg")
activity16.photo.attach(io: file, filename: "activity16.jpg", content_type: "image/jpg")
  i = 12
  until i == 23
    Slot.create!(activity: activity16, start_time: DateTime.new(2022, 12, 2, i, 0, 0), end_time: DateTime.new(2022, 12, 2, (i+1), 0, 0) )
    i += 1
  end
activity16.save!
