require 'tinder'

token = ENV['FB_TOKEN']

client = Tinder::Client.new(token)
client.recs.each do |user|
  puts user['name']
  puts user['bio'].gsub("\n", ' ')
  puts user['photos'][0]['url']
  puts '------------'
end
