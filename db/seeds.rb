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

Activity.destroy_all

event_url = 'https://api.list.co.uk/v1/events?location=London'
uri = URI(event_url)
req = Net::HTTP::Get.new(uri)
req["Authorization"] = ENV['LIST_API_KEY']
event_serialized = Net::HTTP.start(uri.hostname,uri.port,use_ssl: uri.scheme == "https") {|http| http.request(req)}
# p event_serialized.body
events = JSON.parse(event_serialized.body)

# puts event.length

# p events

events.each do |event|
  activity = Activity.new
  activity.name = event['name'].strip
  activity.description = event['descriptions'][0]['description'].strip
  activity.opening_time = event['schedules'][0]['start_ts'].strip
  activity.closing_time = event['schedules'][0]['end_ts'].strip
  activity.address  = event['schedules'][0]['place']['address'].strip
  activity.town  = event['schedules'][0]['place']['town'].strip
  activity.post_code  = event['schedules'][0]['place']['postal_code'].strip
  #activity.name  = event['schedules'][0]['place']['name'].strip
  #activity.  = event['schedules'][0]['place']['lat']
  #activity.  = event['schedules'][0]['place']['lng']
  activity.website  = event['website']
  # activity.  = event['tags']
  # activity.photo = "https://source.unsplash.com/random(400x400)"
  activity.photo.nil? ? activity.photo = "https://unsplash.com/photos/F2KRf_QfCqw" : activity.photo = event['images'][0]['url'] 
  puts activity.valid?
  activity.save!
end

puts "there are #{Activity.count} activities"

Restaurant.destroy_all
Bar.destroy_all

place_url = 'https://api.list.co.uk/v1/places?town=london'
uri_place = URI(place_url)
req_place = Net::HTTP::Get.new(uri_place)
req_place["Authorization"] = ENV['LIST_API_KEY']
place_serialized = Net::HTTP.start(uri_place.hostname,uri_place.port,use_ssl: uri_place.scheme == "https") {|http| http.request(req_place)}
# p event_serialized.body
places = JSON.parse(place_serialized.body)

# puts event.length

# p places




  places.each do |place|
    if place['tags'].include? 'restaurants'
      restaurant = Restaurant.new
      restaurant.name = place['name'].strip
      restaurant.description = Faker::Lorem.sentence(word_count: 20)
      # # restaurant.opening_time = place['schedules'][0]['start_ts'].strip
      # # restaurant.closing_time = place['schedules'][0]['end_ts'].strip
      restaurant.address  = place['address'].strip
      restaurant.town  = place['town'].strip
      restaurant.photo = "https://unsplash.com/photos/N_Y88TWmGwA"
      # restaurant.post_code  = place['schedules'][0]['place']['postal_code'].strip
      # place.website  = restaurant['website']
      puts restaurant.valid?
      restaurant.save!
    elsif place['tags'].include? 'pubs & bars'
      bar = Bar.new
      bar.name = place['name'].strip
      bar.description = Faker::Lorem.sentence(word_count: 20)
      # bar.description = place['descriptions'][0]['description'].strip
      # # bar.opening_time = place['schedules'][0]['start_ts'].strip
      # # bar.closing_time = place['schedules'][0]['end_ts'].strip
      bar.address  = place['address'].strip
      bar.town  = place['town'].strip
      # bar.photo = "https://unsplash.com/photos/_wdOjxXPxUU"
      # bar.post_code  = place['schedules'][0]['place']['postal_code'].strip
      # place.website  = bar['website']
      puts bar.valid?
      bar.save!
    end
  end


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

