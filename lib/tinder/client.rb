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

    def recs
      res = Util.get('/user/recs', {}, {'X-Auth-Token': token})
      JSON.parse(res.body)['results']
    end

    def user(id)
      res = Util.get('/user/' + id, {}, {'X-Auth-Token': token})
      JSON.parse(res.body)['results']
    end

    def profile
      res = Util.get('/profile', {}, {'X-Auth-Token': token})
      JSON.parse(res.body)
    end

    def change_filter(age_filter_min: nil, age_filter_max: nil, gender: nil, gender_filter: nil, distance_filter: nil)
      payload = {}

      payload[age_filter_min] = age_filter_min if age_filter_min
      payload[age_filter_max] = age_filter_max if age_filter_max
      payload[distance_filter] = distance_filter if distance_filter

      gender = (gender == 'man' ? 0 : 1) if %w(man woman).include?(gender)
      payload[gender] = gender if gender

      gender_filter = (gender_filter == 'man' ? 0 : 1) if %w(man woman).include?(gender_filter)
      payload[gender_filter] = gender_filter if gender_filter

      res = Util.post('/profile', payload, {'X-Auth-Token': token})
      JSON.parse(res.body)
    end

    def change_location(lat, lon)
      res = Util.post('/user/ping', {lat: lat, lon: lon}, {'X-Auth-Token': token})
      JSON.parse(res.body)
    end
  end
end
