require "twitter_bot/version"
require "twitter_bot/client"

module TwitterBot
  class InvalidConfig < StandardError; end
  # Your code goes here...

  class Bot

    def initialize(credentials = {})
      @credentials = credentials
    end

    def tweet
      url = "https://api.twitter.com/1.1/statuses/update.json"
      TwitterBot::Client.post(url, @credentials)
      "true"
    end

    def retweet
    end

    def reply
    end

    def favorite
    end
  end
  
end
