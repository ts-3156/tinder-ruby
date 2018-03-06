require 'tinder'

token = ENV['FB_TOKEN']
lat = '35.687537'
lon = '139.529551'

client = Tinder::Client.new(token)
client.change_location(lat, lon)
