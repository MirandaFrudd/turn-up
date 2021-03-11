# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'net/http'
require 'faker'
require 'open-uri'

Favourite.destroy_all
Activity.destroy_all

# event_url = 'https://api.list.co.uk/v1/events?location=London'
# uri = URI(event_url)
# req = Net::HTTP::Get.new(uri)
# req["Authorization"] = ENV['LIST_API_KEY']
# event_serialized = Net::HTTP.start(uri.hostname,uri.port,use_ssl: uri.scheme == "https") {|http| http.request(req)}
# # p event_serialized.body
# events = JSON.parse(event_serialized.body)

# # puts event.length

# # p events

# events.each do |event|
#   activity = Activity.new
#   activity.name = event['name'].strip
#   activity.description = event['descriptions'][0]['description'].strip
#   activity.opening_time = event['schedules'][0]['start_ts'].strip
#   activity.closing_time = event['schedules'][0]['end_ts'].strip
#   activity.address  = event['schedules'][0]['place']['address'].strip
#   activity.town  = event['schedules'][0]['place']['town'].strip
#   activity.post_code  = event['schedules'][0]['place']['postal_code'].strip
#   #activity.name  = event['schedules'][0]['place']['name'].strip
#   #activity.  = event['schedules'][0]['place']['lat']
#   #activity.  = event['schedules'][0]['place']['lng']
#   activity.website  = event['website']
#   # activity.  = event['tags']
#   # activity.photo = "https://source.unsplash.com/random(400x400)"
#   # activity.photo = event['images'][0]['url'] rescue ""
#   puts activity.valid?
#   activity.save!
# end

activity1 = Activity.new(
  name: "Tide Lines perform at Scala",
  description: "Scottish four-piece influenced by the traditional music of the West Highlands.",
  address: "Scala, 275 Pentonville Road",
  town: "London",
  post_code: "N1 9NL",
  website: "https://scala.co.uk/events/tide-lines/",
  budget: 2,
  day: false,
  night: true
  )
puts activity1.valid?
file = URI.open('app/assets/images/Tide-Lines-Scala.jpg')
activity1.photo.attach(io: file, filename: 'Tide-Lines-Scala.jpg', content_type: 'image/jpg')
activity1.save!

# puts "there are #{Activity.count} activities"

activity2 = Activity.new(
  name: "Ben Fogle: Tales From the Wilderness",
  description: "TV adventurer Ben Fogle tours with his latest evening of storytelling.",
  address: "Cadogan Hall, 5 Sloane Terrace",
  town: "London",
  post_code: "SW1X 9DQ",
  website: "https://cadoganhall.com/whats-on/ben-fogle-tales-from-the-wilderness/",
  budget: 2,
  day: false,
  night: true
  )
puts activity2.valid?
file = URI.open('app/assets/images/ben-fogle.jpg')
activity2.photo.attach(io: file, filename: 'ben-fogel.jpg', content_type: 'image/jpg')
activity2.save!

activity3 = Activity.new(
  name: "Teamsport Go Karting",
  description: "Take on the Ultimate Indoor Go Karting London Docklands venue with a huge 800m multilevel track.",
  address: "TeamSport Go Karting London Docklands, 3, Herringham Road",
  town: "London",
  post_code: "SE7 8NJ",
  website: "https://www.team-sport.co.uk/go-karting-london-docklands/",
  budget: 3,
  day: true,
  night: false
  )
puts activity3.valid?
file = URI.open('app/assets/images/go-karting.jpg')
activity3.photo.attach(io: file, filename: 'go-karting.jpg', content_type: 'image/jpg')
activity3.save!

activity4 = Activity.new(
  name: "Flight Club",
  description: "Flight Club is the home of Social Darts. A premium experience where technology and quirky interiors combine to make one all-out darts adventure, Flight Club know a thing or two about keeping people entertained, from their oches down to their bottomless brunches.",
  address: "Flight Club, 55 New Oxford Street",
  town: "London",
  post_code: "WC1A 1BS",
  website: "https://flightclubdarts.com/london/location-bloomsbury",
  budget: 2,
  day: true,
  night: true
  )
puts activity4.valid?
file = URI.open('app/assets/images/flight-club.jpg')
activity4.photo.attach(io: file, filename: 'flight-club.jpg', content_type: 'image/jpg')
activity4.save!

activity5 = Activity.new(
  name: "Swingers City",
  description: "Comprising two 9-hole crazy golf courses with three incredible street food vendors, five cocktail drenched bars and a two-storey clubhouse, Swingers - City is the ultimate destination for a spot of competitive socialising.",
  address: "8 Brown's Building",
  town: "London",
  post_code: "EC3A 8AL",
  website: "https://swingers.club/uk",
  budget: 2,
  day: true,
  night: true
  )
puts activity5.valid?
file = URI.open('app/assets/images/swingers-club.jpg')
activity5.photo.attach(io: file, filename: 'swingers-club.jpg', content_type: 'image/jpg')
activity5.save!

activity6 = Activity.new(
  name: "DNA VR Battersea Power Station",
  description: "Experience Virtual Reality in London at DNA VR like never before! Solve mysteries, fight zombies and explore new worlds together.",
  address: "18 Arches Lane, Battersea",
  town: "London",
  post_code: "SW11 8AB",
  website: "https://www.dnavr.co.uk/",
  budget: 3,
  day: true,
  night: true
  )
puts activity6.valid?
file = URI.open('app/assets/images/DNA-VR.jpg')
activity6.photo.attach(io: file, filename: 'DNA-VR.jpg', content_type: 'image/jpg')
activity6.save!

activity7 = Activity.new(
  name: "QUEENS Skate Dine Bowl",
  description: "QUEENS, the iconic ice rink and bowling alley is located on Queensway in the heart of London. With food and drink by MEATliquor, QUEENS is Central London's biggest 'one stop fun shop’.",
  address: "17 Queensway, Bayswater",
  town: "London",
  post_code: "W2 4QP",
  website: "https://queens.london/",
  budget: 2,
  day: true,
  night: true
  )
puts activity7.valid?
file = URI.open('app/assets/images/Queens-skate-dine-bowl.jpg')
activity7.photo.attach(io: file, filename: 'Queens-skate-dine-bowl.jpg', content_type: 'image/jpg')
activity7.save!

activity8 = Activity.new(
  name: "Japanese Whisky Masterclass",
  description: "Step into the world of Japanese whisky and experience cocktail making with this class. Guests will hear about Japanese Whisky production, its history and experience cocktail making together with our mixologists. MAP Maison has one of the largest Japanese Whisky selections in Europe for you to enjoy as well as refined bottled cocktails for gifts and take-away.",
  address: "321, Kingsland Road",
  town: "London",
  post_code: "E8 4DL",
  website: "https://www.mapmaison.com/product-page/japanese-whisky-masterclass",
  budget: 3,
  day: true,
  night: false
  )
puts activity8.valid?
file = URI.open('app/assets/images/japanese-whisky.jpg')
activity8.photo.attach(io: file, filename: 'japanese-whisky.jpg', content_type: 'image/jpg')
activity8.save!

activity9 = Activity.new(
  name: "Yayoi Kusama: Infinity Mirror Rooms",
  description: "Tate presents a rare chance to experience two of Yayoi Kusama’s Infinity Mirror Rooms. These immersive installations will transport you into Kusama’s unique vision of endless reflections.",
  address: "Tate Modern, Bankside",
  town: "London",
  post_code: "SE1 9TG",
  website: "https://www.tate.org.uk/whats-on/tate-modern/exhibition/yayoi-kusama-infinity-mirror-rooms",
  budget: 1,
  day: true,
  night: false
  )
puts activity9.valid?
file = URI.open('app/assets/images/Yayoi-Kusama.jpg')
activity9.photo.attach(io: file, filename: 'Yayoi-Kusama.jpg', content_type: 'image/jpg')
activity9.save!

# activity10 = Activity.new(
#   name: "Gin House Burlesque",
#   description: "Hidden nightclub showcasing a vintage cabaret show in a swanky, prohibition era-themed space.",
#   address: "Kings Head, 257 Kingsland Road, Whitmore Estate",
#   town: "London",
#   post_code: "E2 8AS",
#   website: "https://www.ginhouseburlesque.com/",
#   budget: 3,
#   day: false,
#   night: true
#   )
# puts activity10.valid?
# file = URI.open('app/assets/images/gin-house-burlesque.jpg')
# activity10.photo.attach(io: file, filename: 'gin-house-burlesque.jpg', content_type: 'image/jpg')
# activity10.save!

puts "there are #{Activity.count} activities"

Restaurant.destroy_all
Bar.destroy_all

# place_url = 'https://api.list.co.uk/v1/places?town=london'
# uri_place = URI(place_url)
# req_place = Net::HTTP::Get.new(uri_place)
# req_place["Authorization"] = ENV['LIST_API_KEY']
# place_serialized = Net::HTTP.start(uri_place.hostname,uri_place.port,use_ssl: uri_place.scheme == "https") {|http| http.request(req_place)}
# # p event_serialized.body
# places = JSON.parse(place_serialized.body)

# # puts event.length

# # p places




#   places.each do |place|
#     if place['tags'].include? 'restaurants'
#       restaurant = Restaurant.new
#       restaurant.name = place['name'].strip
#       restaurant.description = Faker::Lorem.sentence(word_count: 20)
#       # # restaurant.opening_time = place['schedules'][0]['start_ts'].strip
#       # # restaurant.closing_time = place['schedules'][0]['end_ts'].strip
#       restaurant.address  = place['address'].strip
#       restaurant.town  = place['town'].strip
#       # restaurant.post_code  = place['schedules'][0]['place']['postal_code'].strip
#       # place.website  = restaurant['website']
#       puts restaurant.valid?
#       restaurant.save!
#     elsif place['tags'].include? 'pubs & bars'
#       bar = Bar.new
#       bar.name = place['name'].strip
#       bar.description = Faker::Lorem.sentence(word_count: 20)
#       # bar.description = place['descriptions'][0]['description'].strip
#       # # bar.opening_time = place['schedules'][0]['start_ts'].strip
#       # # bar.closing_time = place['schedules'][0]['end_ts'].strip
#       bar.address  = place['address'].strip
#       bar.town  = place['town'].strip
#       # bar.post_code  = place['schedules'][0]['place']['postal_code'].strip
#       # place.website  = bar['website']
#       puts bar.valid?
#       bar.save!
#     end
#   end



restaurant1 = Restaurant.new(
  name: "Koya Soho",
  description: "Simple, cafe-style Japanese for udon noodles and small plates served at communal tables.",
  address: "50 Frith St, Soho",
  town: "London",
  post_code: "W1D 4SQ",
  website: "http://www.koya.co.uk/",
  budget: 2,
  day: true,
  night: true
  )
puts restaurant1.valid?
file = URI.open('app/assets/images/koya.jpeg')
restaurant1.photo.attach(io: file, filename: 'koya.jpg', content_type: 'image/jpg')
restaurant1.save!

restaurant2 = Restaurant.new(
  name: "Morito",
  description: "Spartan tapas bar which shares the buzz and the Spanish–North African flavours of next-door Moro.",
  address: "532 Exmouth Market, Farringdon",
  town: "London",
  post_code: "EC1R 4QE",
  website: "http://www.morito.co.uk/",
  budget: 2,
  day: false,
  night: true
  )
puts restaurant2.valid?
file = URI.open('app/assets/images/morito.jpg')
restaurant2.photo.attach(io: file, filename: 'morito.jpg', content_type: 'image/jpg')
restaurant2.save!

restaurant3 = Restaurant.new(
  name: "Clipstone",
  description: "Relaxed eatery serving seasonal dishes of British ingredients alongside inexpensive wines on tap.",
  address: "5 Clipstone St, Fitzrovia",
  town: "London",
  post_code: "W1W 6BB",
  website: "http://www.clipstonerestaurant.co.uk/",
  budget: 3,
  day: true,
  night: true
  )
puts restaurant3.valid?
file = URI.open('app/assets/images/clipstone.jpg')
restaurant3.photo.attach(io: file, filename: 'clipstone.jpg', content_type: 'image/jpg')
restaurant3.save!

restaurant4 = Restaurant.new(
  name: "Din Tai Fung",
  description: "Welcome to Din Tai Fung, a world-renowned Chinese restaurant originating in Taiwan that specializes in soup dumplings and noodles.",
  address: "5 Henrietta St, Covent Garden",
  town: "London",
  post_code: "WC2E 8PS",
  website: "http://www.dintaifung-uk.com/",
  budget: 2,
  day: true,
  night: true
  )
puts restaurant4.valid?
file = URI.open('app/assets/images/dintaifung.jpg')
restaurant4.photo.attach(io: file, filename: 'dintaifung.jpg', content_type: 'image/jpg')
restaurant4.save!

restaurant5 = Restaurant.new(
  name: "Kitty Fisher's Mayfair",
  description: "Modern British fare with a Spanish twist served in a polished, dimly lit space with a bar.",
  address: "10 Shepherd Market, Mayfair",
  town: "London",
  post_code: "W1J 7QF",
  website: "https://www.kittyfishers.com/",
  budget: 3,
  day: false,
  night: true
  )
puts restaurant5.valid?
file = URI.open('app/assets/images/kitty-fishers.jpg')
restaurant5.photo.attach(io: file, filename: 'kitty-fishers.jpg', content_type: 'image/jpg')
restaurant5.save!

restaurant6 = Restaurant.new(
  name: "Som Saa Thai Restaurant",
  description: "Buzzy bar/restaurant in former fabric warehouse, serving old-style Thai cuisine & intriguing drinks.",
  address: "143A Commercial St, Shoreditch",
  town: "London",
  post_code: "E1 6BD",
  website: "http://www.somsaa.com/",
  budget: 2,
  day: true,
  night: true
  )
puts restaurant6.valid?
file = URI.open('app/assets/images/somsaa.jpeg')
restaurant6.photo.attach(io: file, filename: 'somsaa.jpg', content_type: 'image/jpg')
restaurant6.save!

restaurant7 = Restaurant.new(
  name: "SMOKESTAK | london barbecue",
  description: "A smoker and grill take centre stage at this stylishly rustic barbecue joint with a bar and terrace.",
  address: "35 Sclater St, Shoreditch",
  town: "London",
  post_code: "E1 6LB",
  website: "https://smokestak.co.uk/",
  budget: 2,
  day: true,
  night: true
  )
puts restaurant7.valid?
file = URI.open('app/assets/images/smokestak.jpg')
restaurant7.photo.attach(io: file, filename: 'smokestak.jpg', content_type: 'image/jpg')
restaurant7.save!

restaurant8 = Restaurant.new(
  name: "Black Bear Burger Restaurant Shoreditch",
  description: "Casual, rustic spot for sustainable burgers made with aged grass-fed beef plus beer & patio seating.",
  address: "Boxpark 10, Bethnal Green Rd",
  town: "London",
  post_code: "E1 6GY",
  website: "http://www.blackbearburger.com/",
  budget: 1,
  day: true,
  night: false
  )
puts restaurant8.valid?
file = URI.open('app/assets/images/blackbearburger.jpg')
restaurant8.photo.attach(io: file, filename: 'blackbearburger.jpg', content_type: 'image/jpg')
restaurant8.save!


puts "there are #{Restaurant.count} restaurants"

puts "there are #{Bar.count} bars"

p Restaurant.all

p Bar.all

