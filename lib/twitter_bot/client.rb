

module TwitterBot
  class Client
    def initialize(oauth_config)
      @oauth_config = oauth_config
    end

    def get(path)
      @path = path
      oauth = TwitterBot::Oauth.new(path, @oauth_config)
      @request = Net::HTTP::Get.new(uri)
      sign(oauth)
      perform
    end

    def post(path)
      @path = path
      oauth = TwitterBot::Oauth.new(path, @oauth_config)
      @request = Net::HTTP::Get.new(uri)
      sign(oauth)
      perform
    end

    private

    def sign(oauth)
      oauth_helper = OAuth::Client::Helper.new(@request, oauth.params.merge(:request_uri => uri))
      @request["Authorization"] = oauth_helper.header
    end

    def perform
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.request(@request).body
    end

    def build_request(method)
    end

    def port
      uri.port
    end

    def host
      uri.host
    end

    def uri
      @uri ||= URI(twitter_url + @path)
    end

    def twitter_url
      "https://api.twitter.com/1.1/"
    end
  end
end
