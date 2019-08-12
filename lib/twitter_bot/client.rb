require "net/http"

module TwitterBot
  class Client
    class << self
      def get
        puts "Do a GET REQUEST"
      end

      def post(url, headers)
        uri = URI.parse(url)

       # header = { 'Content-Type': "text/json" }

       puts headers
    

        http = Net::HTTP.new(uri.host, uri.port)
        request = Net::HTTP::Post.new(uri.request_uri, headers)
        request.body = headers.to_s

        # Send the request
        response = http.request(request)
      end
    end
  end
end
