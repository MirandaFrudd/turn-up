# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'json'
# require 'net/http'
# require 'faker'
# require 'open-uri'



Favourite.destroy_all
Activity.destroy_all
Restaurant.destroy_all
Bar.destroy_all

# Activity.destroy_all

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
#   activity.photo.nil? ? activity.photo = "https://unsplash.com/photos/F2KRf_QfCqw" : activity.photo = event['images'][0]['url'] 
#   puts activity.valid?
#   activity.save!
# end

# puts "there are #{Activity.count} activities"

# Restaurant.destroy_all
# Bar.destroy_all

# place_url = 'https://api.list.co.uk/v1/places?town=london'
# uri_place = URI(place_url)
# req_place = Net::HTTP::Get.new(uri_place)
# req_place["Authorization"] = ENV['LIST_API_KEY']
# place_serialized = Net::HTTP.start(uri_place.hostname,uri_place.port,use_ssl: uri_place.scheme == "https") {|http| http.request(req_place)}
# # p event_serialized.body
# places = JSON.parse(place_serialized.body)

# # puts event.length

# # p places
# puts "Creating restaurants"

# restaurant_photo = URI.open('https://unsplash.com/photos/N_Y88TWmGwA')


#   places.each do |place|
#     if place['tags'].include? 'restaurants'
#       restaurant = Restaurant.new
#       restaurant.name = place['name'].strip
#       restaurant.description = Faker::Lorem.sentence(word_count: 20)
#       # # restaurant.opening_time = place['schedules'][0]['start_ts'].strip
#       # # restaurant.closing_time = place['schedules'][0]['end_ts'].strip
#       restaurant.address  = place['address'].strip
#       restaurant.town  = place['town'].strip
#       restaurant.photo = "https://unsplash.com/photos/N_Y88TWmGwA"
#       # restaurant.photo.attach(io: restaurant_photo, filename: 'restaurant.jpeg', content_type: 'image/jpeg')
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
#       # bar.photo.attach(io: restaurant_photo, filename: 'restaurant.jpeg', content_type: 'image/jpeg')

#       bar.photo = "https://unsplash.com/photos/_wdOjxXPxUU"
#       # bar.post_code  = place['schedules'][0]['place']['postal_code'].strip
#       # place.website  = bar['website']
#       puts bar.valid?
#       bar.save!
#     end
#   end


# BARS
bar1 = Bar.new(
  name: "The Bletchey",
  description: "Much like the code linked to its namesake, this bar hopes to stay a bit of an enigma. But what we can tell you is that it comes to us from the folks behind highly-successful ABQ who – taking inspiration from the code-breaking operations at Bletchley Park in WWII – have mastered a secret formula that allows them to create a series of bespoke, personality-matched cocktails exclusively for you",
  address: "459 King’s Road",
  town: "London",
  post_code: "SW10 0LR",
  website: "https://www.thebletchley.co.uk/",
  budget: 2,
  day: true,
  night: true
  )
puts bar1.valid?
file = URI.open('app/assets/images/bletchey.jpg')
bar1.photo.attach(io: file, filename: 'bletchey.jpg', content_type: 'image/jpg')
bar1.save!

bar2 = Bar.new(
  name: "Callooh Callay, Chelsea",
  description: "It’s the West London counterpart to the multi-award-winning Callooh Callay in Shoreditch. Housed in a former night-club, and still utilising some of the old features, the decor’s a little off-kilter. Drinks-wise, however, nothing’s changed. On offer is a mix of Calooh Callay classics, as well as some newer creations, shaken up by a bar team from the likes of Sketch and 69 Colebrook Row.",
  address: "316-318 Kings Road", 
  town: "London",
  post_code: "SW3 5UH",
  website: "https://www.calloohcallaybar-chelsea.com/",
  budget: 3,
  day: true,
  night: true
  )
puts bar2.valid?
file = URI.open('app/assets/images/callooh-callay-chelsea.jpg')
bar2.photo.attach(io: file, filename: 'callooh-callay-chelsea.jpg', content_type: 'image/jpg')
bar2.save!

bar3 = Bar.new(
  name: "The Prince",
  description: "It’s a multi-storey eating and drinking den in Earl’s Court, which, alongside three bars and four restaurants, boasts a covered, flower-laden beer garden, with a retractable roof for summer.",
  address: "4 Lillie Road, Earl’s Court",
  town: "London",
  post_code: "SW6 1TT",
  website: "https://www.theprincelondon.com/",
  budget: 3,
  day: true,
  night: true
  )
puts bar3.valid?
file = URI.open('app/assets/images/the-prince.jpg')
bar3.photo.attach(io: file, filename: 'the-prince.jpg', content_type: 'image/jpg')
bar3.save!

bar4 = Bar.new(
  name: "Bunga Bunga",
  description: "It’s a totally over-the-top, fun-loving Italian pizzeria and cocktail bar, where – alongside freshly-made, metre-long pizzas, and sparkler-filled sharing cocktails – you’ll find late-night karaoke, five days a week",
  address: "Battersea Bridge Road",
  town: "London",
  post_code: "SW11 3BA",
  website: "https://www.bungabunga.com/battersea/",
  budget: 4,
  day: true,
  night: true
  )
puts bar4.valid?
file = URI.open('app/assets/images/bunga-bunga.jpg')
bar4.photo.attach(io: file, filename: 'bunga-bunga.jpg', content_type: 'image/jpg')
bar4.save!

bar5 = Bar.new(
  name: "The Distillery",
  description: "Located along Notting Hill’s Portobello Road is this four-storey fun-house of gin. As well as a full-time distillery (where small-batch Portobello Road Gin is made), you’ll find The Ginstitute (their in-house gin school teaching you to blend your own gin); two bars; a gin museum; and a micro hotel. You can quite literally eat, sleep, drink, and learn gin",
  address: "186 Portobello Road, Notting Hill",
  town: "London",
  post_code: "W11 1LA",
  website: "https://www.the-distillery.london/",
  budget: 2,
  day: true,
  night: true
  )
puts bar5.valid?
file = URI.open('app/assets/images/the-distillery.jpg')
bar5.photo.attach(io: file, filename: 'the-distillery.jpg', content_type: 'image/jpg')
bar5.save!

bar6 = Bar.new(
  name: "Barts",
  description: "Hidden away behind an inconspicuous black door in Chelsea is this eccentric, 1930’s-inspired drinking den. Get the password right and you’ll be ushered inside where – dressed up in a little fancy dress – you can work your way through their 40+ cocktail list, including sharing cocktails served up in full china tea-sets",
  address: "Chelsea Cloisters, Sloane Avenue",
  town: "London",
  post_code: "SW3 3DW",
  website: "https://www.barts-london.com/",
  budget: 3,
  day: true,
  night: true
  )
puts bar6.valid?
file = URI.open('app/assets/images/barts.jpg')
bar6.photo.attach(io: file, filename: 'barts.jpg', content_type: 'image/jpg')
bar6.save!

bar7 = Bar.new(
  name: "Trailer Happiness",
  description: "It’s Grade A “kooky date” territory, serving up a concise list of bar snacks (including plantain crisps, shrimp dumplings and Jamaican patties) alongside the real reason for going – the cocktails.",
  address: "177 Portobello Rd",
  town: "London",
  post_code: "W11 2DY",
  website: "http://trailerh.com/",
  budget: 3,
  day: true,
  night: true
  )
puts bar7.valid?
file = URI.open('app/assets/images/trailer-happiness.jpg')
bar7.photo.attach(io: file, filename: 'trailer-happiness.jpg', content_type: 'image/jpg')
bar7.save!

bar8 = Bar.new(
  name: "Coupette",
  description: "Easily one of our favourite bars in London, Coupette is an unpretentious, cosy cocktail den where the drinks all hover around the £10 mark, and yet do mystical things with maple vermouth, sunflower seeds, burnt treacle and smoke",
  address: "423 Bethnal Green Road",
  town: "London",
  post_code: "E2 0AN",
  website: "https://coupette.co.uk/Coupette",
  budget: 2,
  day: true,
  night: true
  )
puts bar8.valid?
file = URI.open('app/assets/images/coupette.jpg')
bar8.photo.attach(io: file, filename: 'coupette.jpg', content_type: 'image/jpg')
bar8.save!

bar9 = Bar.new(
  name: "Barge East",
  description: "We'd like to draw your attention to Barge East, a glorious floating bar and restaurant set on a (surprisingly roomy) 114 year-old Dutch cargo barge.",
  address: "Sweetwater Mooring, River Lee, White Post Lane, Hackney Wick",
  town: "London",
  post_code: "E9 5EN",
  website: "https://www.bargeeast.com/",
  budget: 4,
  day: true,
  night: true
  )
puts bar9.valid?
file = URI.open('app/assets/images/barge-east.jpg')
bar9.photo.attach(io: file, filename: 'barge-east.jpg', content_type: 'image/jpg')
bar9.save!

bar10 = Bar.new(
  name: "Discount Suit Company",
  description: "A textbook date spot tucked away in a tailor’s old stock room, with Motown records and cocktails mixed by barkeeps fully fluent in the language of good drinks",
  address: "29 Wentworth Street",
  town: "London",
  post_code: "E1 7TB",
  website: "https://discountsuitcompany.co.uk/",
  budget: 3,
  day: true,
  night: true
  )
puts bar10.valid?
file = URI.open('app/assets/images/discount-suit-company.jpg')
bar10.photo.attach(io: file, filename: 'discount-suit-company.jpg', content_type: 'image/jpg')
bar10.save!

# END BARS

# RESTAURANTS

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

restaurant9 = Restaurant.new(
  name: "St John, Smithfield",
  description: "The simply white-washed walls make no attempt to hide the colourful past of St. John, a Clerkenwell institution that resides in a building which has changed very little over the years.",
  address: "26 St. John Street, Smithfield",
  town: "London",
  post_code: "EC1M 4AY",
  website: "https://stjohnrestaurant.com/a/restaurants/smithfield",
  budget: 1,
  day: true,
  night: false
  )
puts restaurant9.valid?
file = URI.open('app/assets/images/st-john.jpg')
restaurant9.photo.attach(io: file, filename: 'st-john.jpg', content_type: 'image/jpg')
restaurant9.save!

restaurant10 = Restaurant.new(
  name: "The Clove Club",
  description: "According to the critics, there are only 26 places on planet earth where you can enjoy a better meal than at The Clove Club.  According to everyone who has eyes, the restaurant itself – set in the 150 year old Shoreditch Town Hall – is pretty damn beautiful.",
  address: "Shoreditch Town Hall, 380 Old Street",
  town: "London",
  post_code: "EC1V 9LT",
  website: "https://thecloveclub.com/",
  budget: 1,
  day: true,
  night: false
  )
puts restaurant10.valid?
file = URI.open('app/assets/images/clove-club.jpg')
restaurant10.photo.attach(io: file, filename: 'clove-club.jpg', content_type: 'image/jpg')
restaurant10.save!


puts "there are #{Restaurant.count} restaurants"

puts "there are #{Bar.count} bars"

p Restaurant.all

p Bar.all

