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

p events.first

events.each do |event|
  activity = Activity.new
  activity.name = event['name'].strip
  activity.description = event['descriptions'][0]['description'].strip
  puts activity.valid?
  activity.save!
end


