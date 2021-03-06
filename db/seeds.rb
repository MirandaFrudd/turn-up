# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'net/http'

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
  #activity.  = event['tags']
  #activity.photo = event['images'][0]['url']
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
      # restaurant.description = place['descriptions'][0]['description'].strip
      # # restaurant.opening_time = place['schedules'][0]['start_ts'].strip
      # # restaurant.closing_time = place['schedules'][0]['end_ts'].strip
      restaurant.address  = place['address'].strip
      restaurant.town  = place['town'].strip
      # restaurant.post_code  = place['schedules'][0]['place']['postal_code'].strip
      # place.website  = restaurant['website']
      puts restaurant.valid?
      restaurant.save!
    elsif place['tags'].include? 'pubs & bars'
      bar = Bar.new
      bar.name = place['name'].strip
      # bar.description = place['descriptions'][0]['description'].strip
      # # bar.opening_time = place['schedules'][0]['start_ts'].strip
      # # bar.closing_time = place['schedules'][0]['end_ts'].strip
      bar.address  = place['address'].strip
      bar.town  = place['town'].strip
      # bar.post_code  = place['schedules'][0]['place']['postal_code'].strip
      # place.website  = bar['website']
      puts bar.valid?
      bar.save!
    end
  end

  


puts "there are #{Restaurant.count} restaurants"

puts "there are #{Bar.count} bars"


p Restaurant.all

p Bar.all