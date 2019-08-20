require "oauth"

module TwitterBot
  class Oauth
    def initialize(url, config)
      @url = url
      @config = config
    end

    def params
      consumer = OAuth::Consumer.new @config.consumer_key,
                                     @config.consumer_secret,
                                     { :site => @url }
      access_token = OAuth::AccessToken.new(consumer, @config.access_token, @config.access_token_secret)
      { :consumer => consumer, :token => access_token }
    end

  end
end
