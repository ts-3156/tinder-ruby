require 'net/http'
require 'uri'
require 'json'

require 'dotenv/load'

HEADERS = {
    'Content-Type': 'application/json',
    'User-agent': 'Tinder/7.5.3 (iPhone; iOS 10.3.2; Scale/2.00)'
}

def request(method, endpoint, payload, headers)
  uri = URI.parse('https://api.gotinder.com' + endpoint)
  https = Net::HTTP.new(uri.host, uri.port)

  https.use_ssl = true
  req =
      if method == :post
        Net::HTTP::Post.new(uri.request_uri)
      else
        Net::HTTP::Get.new(uri.request_uri)
      end

  HEADERS.merge(headers).each {|k, v| req[k] = v}

  req.body = payload.to_json

  https.request(req)
end

def post(endpoint, payload, headers = {})
  request(:post, endpoint, payload, headers)
end

class Client
  attr_reader :token

  def initialize(fb_token = nil)
    @token = fb_token ? auth(fb_token)['token'] : nil
  end

  def auth(fb_token)
    res = post('/auth', {facebook_token: fb_token})
    JSON.parse(res.body)
  end

  def profile
    res = post('/profile', {}, {'X-Auth-Token': token})
    JSON.parse(res.body)
  end

  def change_location(lat, lon)
    res = post('/user/ping', {lat: lat, lon: lon}, {'X-Auth-Token': token})
    JSON.parse(res.body)
  end
end

token = ENV['FB_TOKEN']
lat = '35.687537'
lon = '139.529551'

client = Client.new(token)
client.change_location(lat, lon)
