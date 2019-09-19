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

    def perform(request_klass, path)
      @uri = URI(path)
      oauth = TwitterBot::Oauth.new(path, @oauth_config)

      request = request_klass.new(@uri)
      signed_request = sign_request(request, oauth)

      http = Net::HTTP.new(@uri.host, @uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      result = http.request(signed_request).body
      result
    end

    def sign_request(request, oauth)
      oauth_helper = OAuth::Client::Helper.new(request, oauth.params.merge(:request_uri => @uri))
      request["Authorization"] = oauth_helper.header
      request
    end


  end
end
