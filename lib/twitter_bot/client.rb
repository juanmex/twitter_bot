module TwitterBot
  class Client
    def initialize(oauth_config)
      @oauth_config = oauth_config
    end

    def get(path)
      perform(Net::HTTP::Get, path)
    end

    def post(path)
      perform(Net::HTTP::Post, path)
    end

    private

    def perform(request, path)
      @path = path
      signed_request = sign_request(request.new(uri))
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.request(signed_request).body
    end

    def sign_request(request)
      oauth_helper = OAuth::Client::Helper.new(request, oauth.params.merge(:request_uri => uri))
      request["Authorization"] = oauth_helper.header
      request
    end

    def oauth
      TwitterBot::Oauth.new(@path, @oauth_config)
    end

    def port
      uri.port
    end

    def host
      uri.host
    end

    def uri
      @uri ||= URI(@path)
    end

  end
end
