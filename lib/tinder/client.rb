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

    def change_filter(age_filter_min: 18, age_filter_max: 30, gender: 0, gender_filter: 1, distance_filter: 50)
      if gender.is_a?(String)
        gender = gender == 'man' ? 0 : 1
      end

      if gender_filter.is_a?(String)
        gender_filter = gender_filter == 'man' ? 0 : 1
      end

      payload = {
          age_filter_min: age_filter_min,
          age_filter_max: age_filter_max,
          gender: gender,
          gender_filter: gender_filter,
          distance_filter: distance_filter
      }

      res = Util.post('/profile', payload, {'X-Auth-Token': token})
      JSON.parse(res.body)
    end

    def change_location(lat, lon)
      res = Util.post('/user/ping', {lat: lat, lon: lon}, {'X-Auth-Token': token})
      JSON.parse(res.body)
    end
  end
end
