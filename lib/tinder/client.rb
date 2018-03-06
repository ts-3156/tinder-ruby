module Tinder
  class Client
    attr_reader :token

    def initialize(fb_token = nil)
      @token = fb_token ? auth(fb_token)['token'] : nil
    end

    def auth(fb_token)
      res = Util.post('/auth', {facebook_token: fb_token})
      JSON.parse(res.body)
    end

    def profile
      res = Util.post('/profile', {}, {'X-Auth-Token': token})
      JSON.parse(res.body)
    end

    def change_location(lat, lon)
      res = Util.post('/user/ping', {lat: lat, lon: lon}, {'X-Auth-Token': token})
      JSON.parse(res.body)
    end
  end
end
