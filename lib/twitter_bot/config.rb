module TwitterBot
    class Config < TwitterBot::Base
        attr_accessor :consumer_key, :consumer_secret, :access_token, :access_token_secret
    end
end