module Tinder
  class Util
    HEADERS = {
        'Content-Type': 'application/json',
        'User-agent': 'Tinder/7.5.3 (iPhone; iOS 10.3.2; Scale/2.00)'
    }

    class << self
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
    end
  end
end
